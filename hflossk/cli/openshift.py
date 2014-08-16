from sh import git
import os
import six
import tempfile
import uuid

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
    def __init__(self, name, delete=True):
        self.branch = name
        self.delete = delete

        # save the starting branch so we know where to go back to
        self.start = git.symbolic_ref("--short", "HEAD").strip()

    def __enter__(self):
        try:
            git.checkout(self.branch)
        except:
            git.checkout("-b", self.branch)

    def __exit__(self, exc_type, value, tb):
        if value is None:
            git.checkout("--force", self.start)
            if self.delete:
                git.branch("-D", self.branch)
        else:
            six.reraise(exc_type, value, tb)


def push_to_openshift(remote=None):
    branch = "temp-{}".format(str(uuid.uuid4())[:8])

    # make a temporary branch to push
    with TempBranch(branch, delete=(remote is not None)):
        _, name = tempfile.mkstemp(suffix=".patch")
        with open(name, 'w') as f:
            f.write(openshift_patch)
        git.am(name)
        os.remove(name)
        if remote is None:
            print("No remote to push to.")
        else:
            git.push("--force", remote, "{}:master".format(branch))
