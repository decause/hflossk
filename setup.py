#!/bin/env python
# -*- coding: utf8 -*-

from distribute_setup import use_setuptools
use_setuptools()

from setuptools import setup, find_packages

version = "0.1.0"

setup(
    name="hflossk",
    version=version,
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
        "flask",
        "mako",
        "hovercraft",
        "flask-mako",
        "feedparser",
        "pyyaml",
    ],
    #TODO: Deal with entry_points
    #entry_points="""
    #[console_scripts]
    #pythong = pythong.util:parse_args
    #"""
)
