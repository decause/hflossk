HFLOSSK
=======

Wat?
----
This repository is an experiment to use Flask, Mako, and Bootstrap to make a
website for the Humanitarian Free/Open Source Software Course at RIT. This
repository is a work in progress (as any FOSS project is), and will be open for
contributions.

The content shown here is a compilation of course materials from 4 previous
professors, who've run the course 5 separate times. Those profs are:
    - Stephen Jacobs
    - Dave Shein (x2)
    - Ralph Bean
    - Justin Sherrill


License
=======

Copyright 2013 Remy DeCausemaker

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License.  You may obtain a copy of the
License at

                http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License.


Setting up your environment
---------------------------

Before you can do anything with this (run the webserver locally, or any of the
scripts) you'll need to setup and activate a python `virtualenv
<http://pypi.python.org/pypi/virtualenv>`_.  Run the following at the command
prompt...

On Linux/Mac OS X
+++++++++++++++++

If you don't have virtualenv installed yet, try::

 $ sudo easy_install virtualenv virtualenvwrapper

If you're using a distro like Fedora or Ubuntu, you should try this instead::

 Fedora:
 $ sudo yum install python-virtualenv

 Ubuntu/Debian:
 $ sudo apt-get install python-virtualenv

Once you have virtualenv installed, you should be able to run::

 $ cd code
 $ git clone git@github.com:YOUR_USERNAME/hflossk.git
 $ virtualenv --no-site-packages -p python2 hflosskenv
 $ . hflosskenv/bin/activate
 $ cd hflossk
 $ python setup.py develop

On Windows
++++++++++

At the windows command prompt::

 $ virtualenv --no-site-packages -p python2 hflosskenv
 $ hflosskenv/Scripts/activate.bat

In msysGit or git-bash::

 $ git clone git@github.com:YOUR_USERNAME/hflossk.git

Back in the windows command prompt::

 $ cd hflossk
 $ python setup.py develop


Building the "Documentation"
----------------------------

The "documentation" for the course (the syllabus, all the homework assignments,
notes on the lectures) are all kept in this repository.

Files that end with the extension ``.rst`` are written in the `reStructuredText
<http://sphinx.pocoo.org/rest.html>`_ markup language.

Files that end with the extension ``.mak`` are written in the `Mako Templating
<http://makotemplates.org>`_ language. The nice thing about .mak files is that
you can also just write plain html into the template, or you can mix python
with your html! It has been pointed out that though this is powerful, it can be
dangerous if you are not careful (or don't know what you are doing) ;)

You might notice that the syllabus, et. al. is hosted on
http://openshift.redhat.com/. Openshift is similar to other
Platform-as-a-service websites, such as heroku, or Google App Engine, that
allow you to host webapps. There is a free-tier that allows you to have 3
"gears," and we are using just 1 gear to host the course website. You can
quickstart many common webapps and frameworks on openshift, or just hack
together your own with the DIY cartridge. This is not something you will be
required to do, but is possible to pick up during the course.

To be careful, you should run the server locally (on your machine) to check
that whatever modifications you made to the files actually renders the way you want.

In order to do that, first make sure you have your virtualenv activated.

Being certain of that, in the root directory, simply run::

 $ python run.py

You should see a success message such as::

  * Running on http://127.0.0.1:5000/
  * Restarting with reloader

Open that URL in your browser to view the site
