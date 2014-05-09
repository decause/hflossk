"""
Author: Remy D <remyd@civx.us>
        Ralph Bean <rbean@redhat.com>
        Sam Lucidi <mansam@csh.rit.edu>
License: Apache 2.0

"""

from __future__ import division

import os
import glob
import yaml
import hashlib
from datetime import datetime, timedelta

# flask dependencies
from flask import Flask
from flask import jsonify
from flask.ext.mako import MakoTemplates, render_template
from werkzeug.exceptions import NotFound

# hflossk
from hflossk.util import count_posts
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

config = inject_yaml()
COURSE_START = datetime.combine(config['course']['start'], datetime.min.time())
COURSE_END = datetime.combine(config['course']['end'], datetime.max.time())



def gravatar(email):
    """
    Get a gravatar for an email address.

    I wish I could use libravatar here, but honestly, the students
    will be better off using gravatar at this point (due to github
    integration :/)

    """

    email = email.encode('utf8').lower()
    slug = hashlib.md5(email).hexdigest()
    libravatarURL = "https://seccdn.libravatar.org/avatar/"
    gravatarURL = "https://secure.gravatar.com/avatar/"
    return libravatarURL + slug +"?d=" + gravatarURL + slug


@app.route('/', defaults=dict(page='home'))
@app.route('/<page>')
def simple_page(page):
    """
    Render a simple page. Looks for a .mak template file
    with the name of the page parameter that was passed in.
    By default, this just shows the homepage.

    """

    return render_template('{}.mak'.format(page), name='mako')


@app.route('/syllabus')
def syllabus():
    """
    Render the syllabus page.

    """

    with open(os.path.join(base_dir, 'schedule.yaml')) as schedule_yaml:
        schedule = yaml.load(schedule_yaml)
    return render_template('syllabus.mak', schedule=schedule, name='mako')

@app.route('/blog/<username>')
def blog_posts(username):
    """
    Count number of posts on a student's
    blog.

    """

    student_data = None
    yaml_dir = 'scripts/people/'
    fname = os.path.join(yaml_dir, username + ".yaml")
    with open(fname) as student:
        contents = yaml.load(student)
        if not isinstance(contents, list):
            raise ValueError("%s's yaml file is broken." % fname)
        student_data = contents[0]

    num_posts = 0
    if 'feed' in student_data:
        print("Checking %s's blog feed." % username)
        num_posts = count_posts(student_data['feed'], COURSE_START)
    else:
        print("No feed listed for %s!" % username)
        raise NotFound()

    return jsonify(number=num_posts)

@app.route('/participants')
@app.route('/checkblogs')
def participants():
    """
    Render the participants page,
    which shows a directory of all
    the students with their forge
    links, blog posts, assignment
    links, and etc.

    """

    yaml_dir = 'scripts/people/'

    student_data = []
    for fname in glob.glob(yaml_dir + "*.yaml"):
        with open(fname) as students:
            contents = yaml.load(students)

            if not isinstance(contents, list):
                raise ValueError("%r is borked" % fname)

            student_data.extend(contents)

    assignments = ['litreview1']
    target_number = int((datetime.today() - COURSE_START).total_seconds() /
                        timedelta(weeks=1).total_seconds() + 1 + len(assignments))

    return render_template(
        'blogs.mak', name='mako',
        student_data=student_data,
        gravatar=gravatar,
        target_number=target_number
    )


@app.route('/oer')
@app.route('/resources')
def resources():
    resources = dict()
    resources['Decks'] = os.listdir(os.path.join(base_dir, 'static', 'decks'))
    resources['Books'] = os.listdir(os.path.join(base_dir, 'static', 'books'))
    resources['Challenges'] = os.listdir(os.path.join(base_dir, 'static', 'challenges'))

    return render_template('resources.mak', name='mako', resources=resources)


app.register_blueprint(homework, url_prefix='/assignments')
app.register_blueprint(lectures, url_prefix='/lectures')
app.register_blueprint(quizzes, url_prefix='/quizzes')
