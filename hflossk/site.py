"""
Author: Remy D <remyd@civx.us>
        Ralph Bean <rbean@redhat.com>
License: Apache 2.0
"""
from __future__ import division
import os
import threading

from flask import Flask
from flask.ext.mako import MakoTemplates, render_template
from flask_mail import Mail, Message

import yaml
import feedparser
from datetime import datetime, timedelta
import time
import hashlib
import glob

from hflossk.blueprints import homework, lectures, quizzes

app = Flask(__name__)
app.config.update(
    MAIL_SERVER='stmp.gmail.com',
    MAIL_PORT=465,
    MAIL_USE_SSL=True,
    MAIL_USERNAME = 'USERNAMEGOESHERE',
    MAIL_PASSWORD = 'PASSWORDGOESHERE'
    )
mail=Mail(app)
app.template_folder = "templates"
mako = MakoTemplates(app)


base_dir = os.path.split(__file__)[0]


# Automatically include site config
@app.context_processor
def inject_yaml():
    with open(os.path.join(base_dir, 'site.yaml')) as site_yaml:
        site_config = yaml.load(site_yaml)
    return site_config

def get_schedule():
    with open(os.path.join(base_dir, 'schedule.yaml')) as schedule_yaml:
        schedule = yaml.load(schedule_yaml)
    return schedule

def homework_reminder():
    site_config = inject_yaml()
    schedule = get_schedule()
    start_date = site_config['course']['start']
    due_dates = []
    one_week = datetime(1,1,8) - datetime(1,1,1)
    two_days = datetime(1,1,3) - datetime(1,1,1)
    current_week = start_date
    for week in schedule:
        second_day = False
        for weeks_class in week['week']:
            if 'due' in weeks_class:
                if(second_day):
	            due_dates.append(current_week)
                else:
                    due_dates.append(current_week + two_days)
            second_day = True
        current_week = current_week + one_week
    for due_date in due_dates:
        send_time = due_date - datetime.now().date() - two_days
	if send_time.total_seconds() > 0:
	    t = threading.Timer(send_time.total_seconds(), send_email)
	    t.start()

def send_email():
    try:
        student_data = get_student_data()
        emails = []
        for student in student_data:
            emails.append(student['rit_dce'] + '@rit.edu')
        msg = Message(
            'HFOSS HW DUE IN 2 DAYS', 
	    sender='YOUREMAILHERE',
	    recipients=emails)
        msg.body = "YO, DO THAT HOMEWORK"
        mail.send(msg)
    except:
        print "error sending email, make sure you configured an email"
   

def gravatar(email):
    """ I wish I could use libravatar here, but honestly, the students
    will be better off using gravatar at this point (due to github
    integration :/) """

    slug = hashlib.md5(email.lower()).hexdigest()
    return "https://secure.gravatar.com/avatar/" + slug


@app.route('/', defaults=dict(page='home'))
@app.route('/<page>')
def simple(page):
    return render_template('{}.mak'.format(page), name='mako')


@app.route('/syllabus')
def syllabus():
    schedule = get_schedule()
    return render_template('syllabus.mak', schedule=schedule, name='mako')


def check_blog(queue, feed, name, target):
    """
    Returns the number of entries made to this feed since target.
    """

    feed = feedparser.parse(feed)
    when = []
    for item in feed.entries:
        publish_time = datetime.fromtimestamp(time.mktime(item.updated_parsed))
        if publish_time < target:
            continue
        when.append(item.updated)
    queue.append((name, len(when)))

def get_student_data():
    student_data = []
    yaml_dir = 'scripts/people/' 
    for fname in glob.glob(yaml_dir + "*.yaml"):
        with open(fname) as students:
            contents = yaml.load(students)

            if not isinstance(contents, list):
                raise ValueError("%r is borked" % fname)

            student_data.extend(contents)
    return student_data

@app.route('/checkblogs')
def checkblogs():
    
    student_data = get_student_data()

    target = datetime(2014, 2, 02)
    student_posts = {}
    threads = []
    results = []
    for student in student_data:
        if student.get('feed'):
            print('Checking %s' % student['irc'])
            t = threading.Thread(target=check_blog,
                                 args=(results, student['feed'],
                                       student['irc'], target))
            t.start()
            threads.append(t)
        else:
            print('No feed listed for %s!' % student['irc'])

    for t in threads:
        # Don't give it more than 5 seconds to try.
        t.join(5)

    for name, result in results:
        student_posts[name] = result

    average = sum(student_posts.values()) / len(student_data)

    assignments = ['litreview1']
    target_number = int((datetime.today() - target).total_seconds() /
                        timedelta(weeks=1).total_seconds() + 1 + len(assignments))

    return render_template('blogs.mak', name='mako',
                           student_data=student_data,
                           student_posts=student_posts,
                           gravatar=gravatar, average=average,
                           target_number=target_number,
                          )


@app.route('/oer')
def oer():
    resources = dict()
    resources['Decks'] = os.listdir(os.path.join(base_dir, 'static', 'decks'))
    resources['Books'] = os.listdir(os.path.join(base_dir, 'static', 'books'))
    resources['Challenges'] = os.listdir(os.path.join(base_dir, 'static', 'challenges'))

    return render_template('oer.mak', name='mako', resources=resources)

homework_reminder()
app.register_blueprint(homework, url_prefix='/hw')
app.register_blueprint(lectures, url_prefix='/lectures')
app.register_blueprint(quizzes, url_prefix='/quiz')
