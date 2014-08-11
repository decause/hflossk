#!/bin/env python3
# A script to make sure that malformed yaml files are caught by testing
import os
import yaml


for root, dirs, fnames in os.walk(os.getcwd()):
    for fname in fnames:
        if not fname.endswith('.yaml'):
            continue

        fullname = os.path.join(root, fname)
        with open(fullname, 'r') as yfile:
            try:
                contents = yaml.load(yfile)
                if not isinstance(contents, list) and "/people/" in fullname:
                    raise ValueError("{}'s yaml file is broken.".format(fullname))
            except Exception as e:
                raise Exception("File {name} threw exception: {exc}".format(name=fullname, exc=str(e)))
