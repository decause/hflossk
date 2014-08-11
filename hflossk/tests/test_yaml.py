import os
import yaml
import unittest

from validator import Required, validate, InstanceOf


class TestAllYaml(unittest.TestCase):

    def test_recursive_yaml(self):
        yaml_files = []
        for root, _, fnames in os.walk(os.getcwd()):
            for fname in fnames:
                if (fname.endswith('.yaml') or fname.endswith('.yml')):
                    yaml_files.append(os.path.join(root, fname))

        for fullname in yaml_files:
            with open(fullname, 'r') as yfile:
                try:
                    yaml.load(yfile)
                except Exception as e:
                    msg = "File {name} is broken: {exc}"
                    self.fail(msg.format(name=fullname, exc=str(e)))

    def test_student_yaml(self):
        spec = {
            'blog': [Required, InstanceOf(type(""))],
            'feed': [Required, InstanceOf(type(""))],
            'forges': [Required, InstanceOf(list)],
            'irc': [Required, InstanceOf(type(""))],
            'name': [Required, InstanceOf(type(""))],
            'rit_dce': [Required, InstanceOf(type(""))],
        }

        student_files = []
        for root, _, fnames in os.walk(os.path.join(os.getcwd(), "scripts/people")):
            for fname in fnames:
                if (fname.endswith('.yaml') or fname.endswith('.yml')):
                    student_files.append(os.path.join(root, fname))

        for fullname in student_files:
            with open(fullname, 'r') as student:
                content = yaml.load(student)
                validity = validate(spec, content[0])
                if not validity[0]:
                    out = ""
                    for k, v in validity[1].items():
                        out += "File: {f} Key: {key} failed check {check}\n\n".format(key=k, check=v, f=fullname)
                    self.fail(out)
