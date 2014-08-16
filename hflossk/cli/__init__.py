"""
Author: Ryan Brown <sb@ryansb.com>
License: Apache 2.0
"""

import os
import click


@click.group()
def cli():
    pass


@cli.command()
def run():
    from hflossk.site import app
    app.static_folder = os.path.join(os.getcwd(), 'static')
    app.run(
        debug=True,
        threaded=True,
    )


@cli.command()
def new():
    directories = {
        "static": {
            "books": None,
            "challenges": None,
            "css": None,
            "decks": None,
            "fonts": None,
            "hw": None,
            "img": None,
            "ipynb": None,
            "js": None,
            "videos": None,
        },
        "people": None,
        "scripts": None,
        "templates": {
            "hw":       None,
            "lectures": None,
            "quiz":     None,
        },
    }

    def mkdirp(prefix, dirs):
        for d, subs in dirs.items():
            qualified = os.path.join(prefix, d)
            if not os.path.isdir(qualified):
                # make the directory if it isn't a thing
                os.makedirs(qualified)
            if subs is None:
                # if it's a leaf of the directory structure
                continue
            mkdirp(qualified, subs)

    #mkdirp(os.getcwd(), directories)

    # TODO: also make a subdirectory of people corresponding with the upcoming
    # academic semester + a sample student
    print(u'\u2714 Made content directories')
    # \u2714 is a check mark
    # \u2717 is an x

    # TODO: include default README with instructions for starting your course
    print(u'\u2714 Glorious README')

    tmpl_dir = os.path.split(__file__)[0].replace('cli', '')
    from distutils import dir_util
    dir_util.copy_tree(tmpl_dir + 'static', os.path.join(os.getcwd(), 'static'))
    dir_util.copy_tree(tmpl_dir + 'templates', os.path.join(os.getcwd(), 'templates'))

    print(u'\u2714 CSS/Javascript for browser art')

    print(u'\u2714 Starter Mako templates for great good')

    print(u'\u2714 Starter yaml files for data driven education')


@cli.command()
def version():
    print("You are using hflossk version 0.5.0")
    print("Get more information at "
          "https://github.com/decause/hflossk")
