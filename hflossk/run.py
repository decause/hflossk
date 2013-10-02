"""
Author: Remy D <remyd@civx.us>
        Ralph Bean <rbean@redhat.com>
License: Apache 2.0
"""
import os

from flask import Flask
from flask.ext.mako import MakoTemplates, render_template

import yaml
import feedparser
from datetime import datetime, timedelta
import time
import hashlib
import urllib2
import glob

from hflossk.blueprints import homework, lectures, quizzes

app = Flask(__name__)
app.template_folder = "templates"
mako = MakoTemplates(app)


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


@app.route('/checkblogs')
def checkblogs():
    yaml_dir = 'scripts/people/'
    try:
        urllib2.urlopen("http://foss.rit.edu", timeout=15)
    except:
        return render_template('ohno.mak', name='mako')
    else:
        student_data = []
        for fname in glob.glob(yaml_dir + "*.yaml"):
            with open(fname) as students:
                contents = yaml.load(students)

                if not isinstance(contents, list):
                    raise ValueError("%r is borked" % fname)

                student_data.extend(contents)

        student_posts = {}
        student_quizes = {}
        student_litreview1 = {}
        student_names = {}
        student_bugfixes= {}

        target = datetime(2013, 8, 25)
        for student in student_data:
            when = []
            if student.get('feed'):
                print('Checking %s' % student['irc'])

                feed = feedparser.parse(student['feed'])

                for item in feed.entries:
                    publish_time = datetime.fromtimestamp(time.mktime
                                                         (item.updated_parsed))
                    if publish_time < target:
                        continue
                    when.append(item.updated)
            else:
                print('No feed listed for %s!' % student['irc'])

            student_posts[student['irc']] = len(when)

            if student.get('quiz1'):
                print('Checking %s' % student['quiz1'])
                student_quizes[student['irc']] = student['quiz1']

            if student.get('litreview1'):
                print('Checking %s' % student['litreview1'])
                student_litreview1[student['irc']] = student['litreview1']

            if student.get('name'):
                print('Checking %s' % student['name'])
                student_names[student['irc']] = student['name']

            if student.get('bugfix'):
                print('Checking %s' % student['name'])
                student_bugfixes[student['irc']] = student['bugfix']

        average = sum(student_posts.values()) / float(len(student_posts))

        assignments = ['quiz1', 'litreview1']
        target_number = int((datetime.today() - target).total_seconds() /
                            timedelta(weeks=1).total_seconds() + 1 + len(assignments))

        return render_template('blogs.mak', name='mako',
                               student_data=student_data,
                               student_posts=student_posts,
                               gravatar=gravatar, average=average,
                               target_number=target_number,
                               student_quizes=student_quizes,
                               student_litreview1=student_litreview1,
                               student_bugfixes=student_bugfixes,
                               student_names=student_names)

    #Raw block, no try/except
    #student_data = []
    #for fname in glob.glob(yaml_dir + "*.yaml"):
    #    with open(fname) as students:
    #        contents = yaml.load(students)

    #        if not isinstance(contents, list):
    #            raise ValueError("%r is broked" % fname)

    #        student_data.extend(contents)
    #        #print gravatar(contents[0]['rit_dce'] + "@rit.edu")

    #student_posts = {}
    #target = datetime(2013, 8, 26)
    #for student in student_data:
    #    when = []
    #    if student.get('feed'):
    #        print('Checking %s' % student['irc'])

    #        feed = feedparser.parse(student['feed'])
    #        #print feed.version

    #        for item in feed.entries:
    #            #from pprint import pprint
    #            #pprint(item)
    #            #if 'published' in item:
    #            #    print student['name'], item.published
    #            ##if 'summary' in item:
    #            ##    print item.summary
    #            publish_time = datetime.fromtimestamp(time.mktime
    #                                                    (item.updated_parsed))
    #            if publish_time < target:
    #                #print('%s is older than %s, ignoring' % (publish_time,
    #                #                                         target))
    #                continue
    #            when.append(item.updated)
    #    else:
    #        print('No feed listed for %s!' % student['irc'])

    #    student_posts[student['irc']] = len(when)

    #average = sum(student_posts.values()) / float(len(student_posts))
    ##print('Average of %f posts' % average)
    #target_number = (datetime.today() - target).total_seconds() /\
    #    timedelta(weeks=1).total_seconds()
    ##for student, count in student_posts.items():
    ##    if count > target_number:
    ##        print('+++%d %s' % (count, student))
    ##    elif count < target_number:
    ##        print('---%d %s' % (count, student))
    ##    else:
    ##        print('===%d %s' % (count, student))
    ##for student in student_data:
    ##    print student
    #return render_template('blogs.mak', name='mako',
    #                        student_data=student_data,
    #                        student_posts=student_posts,
    #                        gravatar=gravatar, average=average,
    #                        target_number=target_number)


@app.route('/books')
def books():
    books = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                    'books'))
    return render_template('books.mak', name='mako', books=books)


@app.route('/slides')
def slides():
    decks = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                    'content'))

    return render_template('decks.mak', name='mako', decks=decks)


@app.route('/oer')
def oer():
    decks = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                    'content'))

    books = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                    'books'))

    challenges = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                         'challenges'))

    return render_template('oer.mak', name='mako', decks=decks, books=books,
                           challenges=challenges)


app.register_blueprint(homework, url_prefix='/hw')
app.register_blueprint(lectures, url_prefix='/lectures')
app.register_blueprint(quizzes, url_prefix='/quiz')


if __name__ == "__main__":
    if 'OPENSHIFT_PYTHON_IP' in os.environ:
        host = os.environ['OPENSHIFT_PYTHON_IP']
        port = int(os.environ['OPENSHIFT_PYTHON_PORT'])
        app.run(host=host, port=port)
    else:
        app.debug = True
        app.run()
