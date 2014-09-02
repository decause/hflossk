"""
Author: Remy D <remyd@civx.us>
        Ralph Bean <rbean@redhat.com>
        Sam Lucidi <mansam@csh.rit.edu>
License: Apache 2.0

"""

from __future__ import division

import os
import yaml
import hashlib
from datetime import datetime

# flask dependencies
from flask import Flask
from flask import jsonify
from flask.ext.mako import MakoTemplates, render_template
from werkzeug.exceptions import NotFound

# hflossk
from hflossk.util import count_posts, app_path
from hflossk.blueprints import homework, lectures, quizzes
from hflossk.participants import participants_bp

app = Flask(__name__)
app.static_folder = app_path("static")
app.templates_folder = app_path("templates")
mako = MakoTemplates(app)


# Automatically include site config
@app.context_processor
def inject_yaml():
    with open(app_path('site.yaml')) as site_yaml:
        site_config = yaml.load(site_yaml)
    return site_config

app.config['MAKO_TRANSLATE_EXCEPTIONS'] = False
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
    return libravatarURL + slug + "?d=" + gravatarURL + slug


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

    with open(app_path('schedule.yaml')) as schedule_yaml:
        schedule = yaml.load(schedule_yaml)
    return render_template('syllabus.mak', schedule=schedule, name='mako')


@app.route('/blog/<username>')
def blog_posts(username):
    """
    Count number of posts on a student's
    blog.

    """

    student_data = None

    fname = username
    with open(fname) as student:
        contents = yaml.load(student)
        student_data = contents

    num_posts = 0
    if 'feed' in student_data:
        print("Checking %s's blog feed." % username)
        num_posts = count_posts(student_data['feed'], COURSE_START)
    else:
        print("No feed listed for %s!" % username)
        raise NotFound()

    return jsonify(number=num_posts)


@app.route('/blogs/<year>/<term>/<username>')
@app.route('/participants/<year>/<term>/<username>')
@app.route('/checkblogs/<year>/<term>/<username>')
def participant_page(year, term, username):
    """
    Render a page that shows some stats about the selected participant
    """

    participant_data = {}
    yaml_dir = app_path('people')
    participant_yaml = os.path.join(yaml_dir, year, term, username + '.yaml')
    with open(participant_yaml) as participant_data:
        participant_data = yaml.load(participant_data)

    return render_template(
        'participant.mak', name='make',
        participant_data=participant_data,
        gravatar=gravatar
    )


@app.route('/oer')
@app.route('/resources')
def resources():
    res = dict()
    oer_links = []
    oer_yaml = app_path("oer.yaml")
    with open(oer_yaml) as oer_data:
        oer_links = yaml.load(oer_data)

    res['links'] = {}
    res['Decks'] = []
    res['Books'] = []
    res['Challenges'] = []
    res['Videos'] = []

    if os.path.exists(app_path('static', 'decks')):
        res['Decks'] = os.listdir(app_path('static', 'decks'))
    if 'decks' in oer_links:
        res['links']['decks'] = oer_links['decks']

    if os.path.exists(app_path('static', 'books')):
        res['Books'] = os.listdir(app_path('static', 'books'))
    if 'books' in oer_links:
        res['links']['books'] = oer_links['books']

    if os.path.exists(app_path('static', 'challenges')):
        res['Challenges'] = os.listdir(app_path('static', 'challenges'))
    if 'challenges' in oer_links:
        res['links']['challenges'] = oer_links['challenges']

    if os.path.exists(app_path('static', 'videos')):
        res['Videos'] = os.listdir(app_path('static', 'videos'))
    if 'videos' in oer_links:
        res['links']['videos'] = oer_links['videos']

    return render_template('resources.mak', name='mako', resources=res)


app.register_blueprint(homework, url_prefix='/assignments')
app.register_blueprint(homework, url_prefix='/hw')
app.register_blueprint(lectures, url_prefix='/lectures')
app.register_blueprint(quizzes, url_prefix='/quizzes')
app.register_blueprint(quizzes, url_prefix='/quiz')
app.register_blueprint(participants_bp, url_prefix='/participants')
app.register_blueprint(participants_bp, url_prefix='/blogs')
app.register_blueprint(participants_bp, url_prefix='/checkblogs')
