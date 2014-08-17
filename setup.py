#!/bin/env python
# -*- coding: utf8 -*-

try:
    from setuptools import setup, find_packages
except ImportError:
    from distribute_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages

from hflossk.version import __version__

setup(
    name="hflossk",
    version=__version__,
    description="HFOSS course materials via flask",
    classifiers=[
        "Intended Audience :: Education",
        "Topic :: Education :: Computer Aided Instruction (CAI)",
    ],
    keywords="",
    author="Remy DeCausemaker",
    author_email="remyd@civx.us",
    url="http://fossrit.github.io/hflossk",
    license="GPLv3+",
    packages=find_packages(
    ),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        "Click>=3.1",
        "Flask-Mako>=0.3",
        "Flask>=0.10.1",
        "Frozen-Flask>=0.11",
        "Mako>=1.0.0",
        "PyYAML>=3.11",
        "dulwich>=0.9.0",
        "feedparser>=5.1.3",
        "six>=1.7.3",
        "tornado>=4.0.1",
    ],
    tests_require=[
        'tox',
        "nose>=1.3.3",
        "pep8",
        "validator.py>=1.2.0",
        "coverage>=3.6",
    ],

    entry_points="""
    [console_scripts]
    hflossk = hflossk.cli:cli
    """
)
