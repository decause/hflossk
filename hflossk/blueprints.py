import os

from flask import Blueprint
from flask.ext.mako import render_template

from hflossk.util import app_path


homework = Blueprint('homework', __name__, template_folder='templates')
lectures = Blueprint('lectures', __name__, template_folder='templates')
quizzes = Blueprint('quizzes', __name__, template_folder='templates')


@homework.route('/', defaults={'page': 'index'})
@homework.route('/<page>')
def display_homework(page):
    if page == 'index':
        hws = os.listdir(app_path('static', 'hw'))
        hws.extend(os.listdir(app_path('templates', 'hw')))
        hws = [hw for hw in sorted(hws) if not hw == "index.mak"]
    else:
        hws = None

    return render_template('hw/{}.mak'.format(page), name='mako', hws=hws)


@lectures.route('/', defaults={'page': 'index'})
@lectures.route('/<page>')
def display_lecture(page):
    if page == 'index':
        lecture_notes = os.listdir(app_path('templates', 'lectures'))
        lecture_notes = [note for note in sorted(lecture_notes)
                         if not note == "index.mak"]
    else:
        lecture_notes = None

    return render_template('lectures/{}.mak'.format(page), name='mako',
                           lectures=lecture_notes)


@quizzes.route('/<quiz_num>')
def show_quiz(quiz_num):
    return render_template('quiz/{}.mak'.format(quiz_num), name='mako')
