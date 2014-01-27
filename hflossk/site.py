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

import yaml
import feedparser
from datetime import datetime, timedelta
import time
import hashlib
import glob

from hflossk.blueprints import homework, lectures, quizzes

app = Flask(__name__)
app.template_folder = "templates"
mako = MakoTemplates(app)


base_dir = os.path.split(__file__)[0]


# Automatically include site config
@app.context_processor
def inject_yaml():
    with open(os.path.join(base_dir, 'site.yaml')) as site_yaml:
        site_config = yaml.load(site_yaml)
    return site_config


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
    with open(os.path.join(base_dir, 'schedule.yaml')) as schedule_yaml:
        schedule = yaml.load(schedule_yaml)
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


@app.route('/checkblogs')
def checkblogs():
    yaml_dir = 'scripts/people/'

    student_data = []
    for fname in glob.glob(yaml_dir + "*.yaml"):
        with open(fname) as students:
            contents = yaml.load(students)

            if not isinstance(contents, list):
                raise ValueError("%r is borked" % fname)

            student_data.extend(contents)

    target = datetime(2014, 1, 27)
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

    assignments = []
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


app.register_blueprint(homework, url_prefix='/hw')
app.register_blueprint(lectures, url_prefix='/lectures')
app.register_blueprint(quizzes, url_prefix='/quiz')
