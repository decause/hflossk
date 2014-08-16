"""
Author: Ryan Brown <sb@ryansb.com>
License: Apache 2.0
"""

import os

import click
import datetime
from distutils import dir_util
from distutils import file_util


@click.group()
def cli():
    pass


@cli.command()
def run():
    from hflossk.site import app
    app.run(
        debug=True,
        threaded=True,
    )


@cli.command()
def new():
    # \u2714 is a check mark
    # \u2717 is an x
    # TODO: include default README with instructions for starting your course
    print(u'\u2714 Glorious README')

    source_dir = os.path.split(__file__)[0].replace('cli', '')

    static_dir = os.path.join(os.getcwd(), 'static')
    dir_util.copy_tree(source_dir + 'static', static_dir, update=True)

    print(u'\u2714 CSS/Javascript for browser art')

    templates_dir = os.path.join(os.getcwd(), 'templates')
    dir_util.copy_tree(source_dir + 'templates', templates_dir, update=True)

    print(u'\u2714 Starter Mako templates for great good')

    yamls_dir = os.path.join(source_dir, 'yamls')

    people_dir = os.path.join(os.getcwd(), 'people', year(), season())
    if not os.path.isdir(people_dir):
        os.makedirs(people_dir)

    file_util.copy_file(os.path.join(yamls_dir, 'fake_student.yaml'),
                        people_dir, update=True)

    file_util.copy_file(os.path.join(yamls_dir, 'site.yaml'),
                        os.getcwd(), update=True)
    file_util.copy_file(os.path.join(yamls_dir, 'schedule.yaml'),
                        os.getcwd(), update=True)

    print(u'\u2714 Starter yaml files for data driven education')


@cli.command()
def version():
    print("You are using hflossk version 0.5.3")
    print("Get more information at "
          "https://github.com/decause/hflossk")


def season():
    if datetime.date.today().month > 6:
        return "fall"
    return "spring"


def year():
    return str(datetime.date.today().year)
