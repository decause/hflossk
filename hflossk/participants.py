import os

import yaml

from flask import Blueprint
from flask.ext.mako import render_template
from datetime import datetime, date, timedelta
import hflossk


participants_bp = Blueprint('participants_bp', __name__, template_folder='templates')


@participants_bp.route('/')
def participants_blank():
    """
    This is the default landing
    for the participants listing page.
    It will list all of the participants
    in the current term for HFOSS
    """
    year = str(date.today().year)
    term = "fall" if date.today().month > 7 else "spring"
    return participants_year_term(year, term)


@participants_bp.route('/<year>')
def participants_year(year): return participants(year + '/')
"""
This will get all the participants
within a given year
"""


@participants_bp.route('/<year>/<term>')
def participants_year_term(year, term): return participants(year + '/' + term + '/')
"""
This will get all the participants
within a given year and term
"""


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

    yaml_dir = 'scripts/people/' + root_dir

    student_data = []
    for dirpath, dirnames, files in os.walk(yaml_dir):
        for fname in files:
            if fname.endswith('.yaml'):
                with open(dirpath + '/' + fname) as students:
                    contents = yaml.load(students)
                    contents[0]['yaml'] = dirpath + '/' + fname
                    year_term_data = dirpath.split('/')
                    contents[0]['participant_page'] = year_term_data[2] + '/' + year_term_data[3] + '/' + os.path.splitext(fname)[0]

                    if not isinstance(contents, list):
                        raise ValueError("%r is borked" % fname)

                    student_data.extend(contents)

    assignments = ['litreview1']
    target_number = int((datetime.today() - hflossk.site.COURSE_START).total_seconds() /
                        timedelta(weeks=1).total_seconds() + 1 + len(assignments))

    return render_template(
        'blogs.mak', name='mako',
        student_data=student_data,
        gravatar=hflossk.site.gravatar,
        target_number=target_number
    )

#
