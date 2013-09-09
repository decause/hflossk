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

app = Flask(__name__)
app.template_folder = "templates"
mako = MakoTemplates(app)


def gravatar(email):
    """ I wish I could use libravatar here, but honestly, the students
    will be better off using gravatar at this point (due to github
    integration :/) """

    slug = hashlib.md5(email.lower()).hexdigest()
    return "https://secure.gravatar.com/avatar/" + slug


yaml_dir = 'scripts/people/'


@app.route('/checkblogs')
def checkblogs():
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

        average = sum(student_posts.values()) / float(len(student_posts))

        target_number = int((datetime.today() - target).total_seconds() /
                            timedelta(weeks=1).total_seconds() + 1)
        return render_template('blogs.mak', name='mako',
                               student_data=student_data,
                               student_posts=student_posts,
                               gravatar=gravatar, average=average,
                               target_number=target_number)

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


@app.route('/')
def index():
    return render_template('home.mak', name='mako')


@app.route('/lectures/w1c2')
def w1c2():
    return render_template('w1c2.mak', name='mako')


@app.route('/lectures/w2c2')
def w2c2():
    return render_template('w2c2.mak', name='mako')


@app.route('/lectures/w3c1')
def w3c1():
    return render_template('w3c1.mak', name='mako')


@app.route('/decause')
def decause():
    return render_template('decause.mak', name='mako')


@app.route('/lectures')
def lectures():
    return render_template('lectures.mak', name='mako')


@app.route('/quiz1')
def quiz1():
    return render_template('quiz1.mak', name='mako')


@app.route('/syllabus')
def syllabus():
    return render_template('syllabus.mak', name='mako')


@app.route('/about')
def about():
    return render_template('about.mak', name='mako')


@app.route('/hw/firstflight')
def fflight():
    return render_template('fflight.mak', name='mako')


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


@app.route('/hw')
def hws():
    hws = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                  'hw'))

    return render_template('hw.mak', name='mako', hws=hws)


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


if __name__ == "__main__":
    if 'OPENSHIFT_PYTHON_IP' in os.environ:
        host = os.environ['OPENSHIFT_PYTHON_IP']
        port = int(os.environ['OPENSHIFT_PYTHON_PORT'])
        app.run(host=host, port=port)
    else:
        app.debug = True
        app.run()
