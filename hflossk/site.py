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
from flask import Flask, jsonify
from flask.ext.mako import MakoTemplates, render_template
from werkzeug.exceptions import NotFound

# hflossk
from hflossk.util import count_posts
from hflossk.blueprints import homework, lectures, quizzes
from hflossk.participants import participants_bp

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

app.config['MAKO_TRANSLATE_EXCEPTIONS'] = False
config = inject_yaml()
COURSE_START = datetime.combine(config['course']['start'], datetime.min.time())
COURSE_END = datetime.combine(config['course']['end'], datetime.max.time())
YAML_LOCATION = os.path.abspath(os.path.join("scripts", "people"))


def gravatar(email):
    """
    Get a gravatar for an email address.

    Attempts to use Libravatar by default, but due to Github
    integration with Gravatar will fall back onto Gravatar

    """

    email = email.encode('utf8').lower()
    slug = hashlib.md5(email).hexdigest()
    libravatarURL = "https://seccdn.libravatar.org/avatar/"
    gravatarURL = "https://secure.gravatar.com/avatar/"
    return libravatarURL + slug + "?d=" + gravatarURL + slug


@app.route('/', defaults={'page': 'home'})
@app.route('/<page>')
def simple_page(page):
    """
    Render a simple page. Looks for a .mak template file
    with the name of the page parameter that was passed in.
    By default, this just shows the homepage.

    """

    return render_template('{}.mak'.format(page), name='mako')


@app.route('/static/manifest.webapp')
def webapp():
    """
    Render as a FxOS App
    """
    return render_template('manifest.webapp',
                           mimetype='application/x-web-app-manifest+json')


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

    for dirpath, dirnames, files in os.walk(YAML_LOCATION):
        for fname in files:
            if (username + '.yaml').lower() == fname.lower():
                with open(os.path.join(dirpath, fname)) as student_file:
                    student_data = yaml.load(student_file)

    if 'feed' in student_data:
        print("Checking %s's blog feed." % username)
        return jsonify(number=count_posts(student_data['feed'], COURSE_START))
    else:
        print("No feed listed for %s!" % username)
        raise NotFound()


@app.route('/blogs/<year>/<term>/<username>')
@app.route('/participants/<year>/<term>/<username>')
@app.route('/checkblogs/<year>/<term>/<username>')
def participant_page(year, term, username):
    """
    Render a page that shows some stats about the selected participant
    """

    person_yaml = os.path.abspath(os.path.join(YAML_LOCATION,
        year, term, username + '.yaml'))
    with open(person_yaml) as participant_file:
        return render_template(
            'participant.mak', name='make',
            participant_data=yaml.load(participant_file),
            gravatar=gravatar
        )


@app.route('/oer')
@app.route('/resources')
def resources():
    res = dict()
    res['Decks'] = os.listdir(os.path.join(base_dir, 'static', 'decks'))
    res['Books'] = os.listdir(os.path.join(base_dir, 'static', 'books'))
    res['Challenges'] = os.listdir(os.path.join(
        base_dir, 'static', 'challenges'))
    res['Videos'] = os.listdir(os.path.join(
        base_dir, 'static', 'videos'))

    return render_template('resources.mak', name='mako', resources=res)


app.register_blueprint(homework, url_prefix='/assignments')
app.register_blueprint(homework, url_prefix='/hw')
app.register_blueprint(lectures, url_prefix='/lectures')
app.register_blueprint(quizzes, url_prefix='/quizzes')
app.register_blueprint(quizzes, url_prefix='/quiz')
app.register_blueprint(participants_bp, url_prefix='/participants')
app.register_blueprint(participants_bp, url_prefix='/blogs')
app.register_blueprint(participants_bp, url_prefix='/checkblogs')
