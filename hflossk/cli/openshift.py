"""
Author: Ryan Brown <sb@ryansb.com>
License: Apache 2.0
"""

import dulwich.porcelain as git
import os
import six
import uuid

from hflossk.version import __version__

openshift_files = {
    "setup.py": {
        "contents": """from setuptools import setup
setup(name='thecourse',
      version='1.0',
      description='courseware on openshift',
      author='Dr. Professor',
      author_email='dr@professor.com',
      url='http://www.python.org/sigs/distutils-sig/',
      install_requires=['hflossk>={version}'],
     )""".format(version=__version__),
    },
    "wsgi.py": {
        "contents": """#!/usr/bin/python
# IMPORTANT: Please do not make changes to this file unless you know what
# you're doing. Thank you.

import os

virtenv = os.environ['OPENSHIFT_PYTHON_DIR'] + '/virtenv/'
virtualenv = os.path.join(virtenv, 'bin/activate_this.py')
try:
    execfile(virtualenv, dict(__file__=virtualenv))
except IOError:
    pass

import hflossk.site

application = hflossk.site.app""",
    },
}

openshift_patch = """
From f5d949dfb8942c3c2e1996d1209816ed371f20a8 Mon Sep 17 00:00:00 2001
From: "Ryan S. Brown" <sb@ryansb.com>
Date: Sat, 16 Aug 2014 16:04:58 -0400
Subject: [PATCH] add setup and wsgi files

---
 setup.py | 10 ++++++++++
 wsgi.py  | 16 ++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 setup.py
 create mode 100644 wsgi.py

diff --git a/setup.py b/setup.py
new file mode 100644
index 0000000..0b3a53c
--- /dev/null
+++ b/setup.py
@@ -0,0 +1,10 @@
+from setuptools import setup
+
+setup(name='thecourse',
+      version='1.0',
+      description='courseware on openshift',
+      author='Dr. Professor',
+      author_email='dr@professor.com',
+      url='http://www.python.org/sigs/distutils-sig/',
+      install_requires=['hflossk>=0.5.3'],
+     )
diff --git a/wsgi.py b/wsgi.py
new file mode 100644
index 0000000..409ddfb
--- /dev/null
+++ b/wsgi.py
@@ -0,0 +1,16 @@
+#!/usr/bin/python
+# IMPORTANT: Please do not make changes to this file unless you know what
+# you're doing. Thank you.
+
+import os
+
+virtenv = os.environ['OPENSHIFT_PYTHON_DIR'] + '/virtenv/'
+virtualenv = os.path.join(virtenv, 'bin/activate_this.py')
+try:
+    execfile(virtualenv, dict(__file__=virtualenv))
+except IOError:
+    pass
+
+import hflossk.site
+
+application = hflossk.site.app
--
1.9.3
"""


class TempBranch(object):
    def __init__(self, name, repo, delete=True):
        self.branch = 'refs/heads/{}'.format(name)
        self.delete = delete
        self.repo = repo

        # save the starting branch so we know where to go back to
        self.start = self.repo.refs.read_ref('HEAD').replace('ref: ', '')

    def __enter__(self):
        self.repo.refs.add_if_new(self.branch, self.repo.head())

        self.repo.refs.set_symbolic_ref('HEAD', self.branch)

    def __exit__(self, exc_type, value, tb):
        if value is None:
            self.repo.refs.set_symbolic_ref('HEAD', self.start)
            # lol, only reset --hard is supported
            git.reset(self.repo, "hard")
            if self.delete:
                self.repo.refs.remove_if_equals(self.branch, None)
        else:
            six.reraise(exc_type, value, tb)


def push_to_openshift(remote=None):
    repo = git.Repo(os.getcwd())
    branch = "temp-{}".format(str(uuid.uuid4())[:8])

    if is_dirty():
        return

    with TempBranch(branch, repo, delete=(remote is not None)):
        for name, file_info in openshift_files.items():
            with open(name, 'w') as f:
                f.write(file_info.get("contents", ""))
                print("Wrote {chars} chars to {name}".format(
                    name=name,
                    chars=len(file_info.get("contents", "")))
                )
            repo.stage(name)
        repo.do_commit("Commit openshift files")
        git.push(remote, "{}:master".format(branch))


def is_clean():
    return not is_dirty()


def is_dirty():
    """Check for uncommitted changes. True if dirty."""
    repo = git.Repo(os.getcwd())
    s = git.status(repo)
    return any(s.staged.values() + [s.unstaged])
