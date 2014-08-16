import os

import yaml

from flask import Blueprint
from flask.ext.mako import render_template
from datetime import datetime, date, timedelta
import hflossk
from hflossk.util import app_path


participants_bp = Blueprint('participants_bp',
                            __name__,
                            template_folder='templates')


currentYear = str(date.today().year)
currentTerm = "fall" if date.today().month > 7 else "spring"


@participants_bp.route('/')
def participants_blank():
    """
    This is the default landing
    for the participants listing page.
    It will list all of the participants
    in the current term for HFOSS
    """
    return participants_year_term(currentYear, currentTerm)


@participants_bp.route('/<year>')
def participants_year(year):
    """
    This will get all the participants
    within a given year
    """
    return participants(year + '/')


@participants_bp.route('/<year>/<term>')
def participants_year_term(year, term):
    """
    This will get all the participants
    within a given year and term
    """
    return participants(year + '/' + term + '/')


@participants_bp.route('/all')
def participants_all():
    return participants('')
"""
This will get all the participants
who have taken HFOSS
"""


def participants(root_dir):
    """
    Render the participants page,
    which shows a directory of all
    the students with their forge
    links, blog posts, assignment
    links, and etc.

    """

    yaml_dir = app_path('people', root_dir)

    student_data = []
    for dirpath, dirnames, files in os.walk(yaml_dir):
        for fname in files:
            if fname.endswith('.yaml'):
                with open(dirpath + '/' + fname) as students:
                    contents = yaml.load(students)
                    contents['yaml'] = dirpath + '/' + fname
                    year_term_data = dirpath.split('/')
                    contents['participant_page'] = "{y}/{t}/{u}".format(
                        y=year_term_data[-3],
                        t=year_term_data[-2],
                        u=os.path.splitext(fname)[0]
                    )
                    contents['isActive'] = (currentYear in year_term_data
                                            and currentTerm in year_term_data)

                    student_data.append(contents)

    assignments = ['litreview1']
    elapsed = (datetime.today() - hflossk.site.COURSE_START).total_seconds()
    target_number = int(elapsed / timedelta(weeks=1).total_seconds() + 1 +
                        len(assignments))

    return render_template(
        'blogs.mak', name='mako',
        student_data=student_data,
        gravatar=hflossk.site.gravatar,
        target_number=target_number
    )

#
