HFLOSSK
=======

.. image:: https://api.travis-ci.org/decause/hflossk.svg

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


Creating a New hflossk Course
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
 $ git clone git@github.com:YOUR_USERNAME/YOUR_COURSENAME-content.git
 $ virtualenv --no-site-packages -p python2 hflosskenv
 $ pip install hflossk
 $ . ./hflosskenv/bin/activate
 $ cd YOUR_COURSENAME-content
 $ hflossk new

Once you've done that you'll probably want to edit some of the
pre-generated files for the course. That way the website will
reflect your course's information.

On Windows
++++++++++

At the windows command prompt::

 $ virtualenv --no-site-packages -p python2 hflosskenv
 $ hflosskenv/Scripts/activate.bat
 $ pip install hflossk

In msysGit or git-bash::

 $ git clone git@github.com:YOUR_USERNAME/YOUR_COURSENAME-content.git

Back in the windows command prompt::

 $ cd YOUR_COURSENAME-content
 $ hflossk new

Once you've done that you'll probably want to edit some of the
pre-generated files for the course. That way the website will
reflect your course's information.

Modifying the Courseware
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
 $ . ./hflosskenv/bin/activate
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

Running the Tests
----------------------------

All tests are run using tox. To run the tests::

$ virtualenv --no-site-packages -p python2 hflosskenv
$ pip install tox
$ tox

Tests check validity of all yaml, and the keys in any student yaml files. Tests
also checks that code conforms to PEP8.

