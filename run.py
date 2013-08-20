import os

from flask import Flask
from flask.ext.mako import MakoTemplates, render_template

import yaml
import feedparser
from datetime import datetime, timedelta
import time

yaml_file = 'scripts/people.yaml'
def checkblogs():
    with open(yaml_file) as students:
        student_data = yaml.load(students)

    student_posts = {}
    target = datetime(2013, 06, 02)
    for student in student_data:
        when = []
        if student.get('feed'):
            print('Checking %s' % student['irc'])

            feed = feedparser.parse(student['feed'])
            #print feed.version

            for item in feed.entries:
                #from pprint import pprint
                #pprint(item)
                #if 'published' in item:
                #    print student['name'], item.published
                if 'summary' in item:
                    print item.summary
                publish_time = datetime.fromtimestamp(time.mktime(item.updated_parsed))
                if publish_time < target:
                    #print('%s is older than %s, ignoring' % (publish_time, target))
                    continue
                when.append(item.updated)
        else:
            print('No feed listed for %s!' % student['irc'])

        student_posts[student['irc']] = len(when)

    average = sum(student_posts.values()) / float(len(student_posts))
    print('Average of %f posts' % average)
    target_number = (datetime.today() - target).total_seconds() /\
        timedelta(weeks=1).total_seconds()
    for student, count in student_posts.items():
        if count > target_number:
            print('+++%d %s' % (count, student))
        elif count < target_number:
            print('---%d %s' % (count, student))
        else:
            print('===%d %s' % (count, student))
    for student in student_data:
        print student
    return render_template('fluid.html', name='mako', student_data=student_data)


app = Flask(__name__)
app.template_folder = "templates"
mako = MakoTemplates(app)


@app.route('/')
def index():
    return render_template('fluid.mak', name='mako')

@app.route('/decause')
def decause():
    return render_template('decause.mak', name='mako')

@app.route('/syllabus')
def syllabus():
    return render_template('syllabus.mak', name='mako')

@app.route('/books')
def books():
    books = os.listdir(os.path.join(os.path.split(__file__)[0], 'static',
                                    'books'))
    return render_template('books.mak', name='mako', books=books)

@app.route('/un')
def un():
    return render_template('basic.mak', name='mako')

@app.route('/carousel')
def carousel():
    return render_template('carousel.html', name='mako')


if __name__ == "__main__":
    app.debug=True
    app.run()
