"""
Author: Ryan Brown <sb@ryansb.com>
License: Apache 2.0
"""

import os
import re

import yaml
import click
from distutils import dir_util
from distutils import file_util

from hflossk.version import __version__
from hflossk.cli.util import year, season
from hflossk.cli.openshift import push_to_openshift, is_clean


@click.group()
def cli():
    pass


@cli.command(short_help="Run your course locally, and view it on "
             "http://localhost:5000")
def run():
    from hflossk.site import app
    app.run(
        debug=True,
        threaded=True,
    )


@cli.command(short_help="Make a new course site from scratch")
def new():
    # \u2714 is a check mark
    # \u2717 is an x
    # TODO: include default README with instructions for starting your course
    click.echo(u'\u2714 Glorious README')

    source_dir = os.path.split(__file__)[0].replace('cli', '')

    static_dir = os.path.join(os.getcwd(), 'static')
    dir_util.copy_tree(source_dir + 'static', static_dir, update=True)

    click.echo(u'\u2714 CSS/Javascript for browser art')

    templates_dir = os.path.join(os.getcwd(), 'templates')
    dir_util.copy_tree(source_dir + 'templates', templates_dir, update=True)

    click.echo(u'\u2714 Starter Mako templates for great good')

    yamls_dir = os.path.join(source_dir, 'yamls')

    people_dir = os.path.join(os.getcwd(), 'people', year(), season())
    if not os.path.isdir(people_dir):
        os.makedirs(people_dir)

    file_util.copy_file(os.path.join(yamls_dir, 'fake_student.yaml'),
                        people_dir, update=True)

    file_util.copy_file(os.path.join(yamls_dir, 'site.yaml'),
                        os.getcwd(), update=True)
    file_util.copy_file(os.path.join(yamls_dir, 'oer.yaml'),
                        os.getcwd(), update=True)
    file_util.copy_file(os.path.join(yamls_dir, 'schedule.yaml'),
                        os.getcwd(), update=True)

    click.echo(u'\u2714 Starter yaml files for data driven education')


@cli.command()
def version():
    click.echo("You are using hflossk version {}".format(__version__))
    click.echo("Get more information at "
               "https://github.com/decause/hflossk")


@cli.command(short_help="Push this to openshift. Requires "
             "http://openshift.com account. Will check for "
             "course.openshift.git_url as well as CLI flag --remote")
@click.option("--verbose", help="Show more info", is_flag=True)
@click.option('--remote', help="Openshift git URL")
def openshift(verbose, remote):
    site_yaml = os.path.join(os.getcwd(), 'site.yaml')

    is_clean() or click.confirm(
        "You have uncommitted changes. Changes that aren't committed "
        "won't be pushed to openshift.\n"
        "Do you want to continue?", abort=True
    )

    if remote is None and os.path.isfile(site_yaml):
        with open(site_yaml, 'r') as site:
            s = yaml.load(site)
            remote = s.get("course", {}
                           ).get("openshift", {}
                                 ).get("git_url", None)
    if remote is None or not re.match(r'ssh://\w*@.*\.git.?$', remote):
        click.echo("The git URL for your Openshift application (should look "
                   "like ssh://1234@course-user.rhcloud.com/~/repo.git)")
        click.echo("To find your git URL, go to your openshift.com dashboard "
                   "and copy the link for your application's source code.")
        return

    if verbose:
        click.echo("Pushing files to openshift {}".format(remote))
    push_to_openshift(remote)
    app_url = re.match(r'[^@]*@([^/]*)', remote).group(1)
    click.echo("Your app is now on Openshift at http://{}/".format(app_url))
