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
        is_str = InstanceOf(type(""))
        spec = {
            'blog': [Required, is_str],
            'feed': [Required, is_str],
            'forges': [Required, InstanceOf(list)],
            'irc': [Required, is_str],
            'name': [Required, is_str],
            'rit_dce': [Required, is_str],
            # optional fields
            'hw': [InstanceOf(dict)],
            'bio': [is_str],
            'twitter': [is_str],
            'coderwall': [is_str],
        }

        student_files = []
        for root, _, fnames in os.walk(
                os.path.join(os.getcwd(), "scripts/people")):
            for fname in fnames:
                if (fname.endswith('.yaml') or fname.endswith('.yml')):
                    student_files.append(os.path.join(root, fname))

        for fullname in student_files:
            with open(fullname, 'r') as student:
                content = yaml.load(student)
                validity = validate(spec, content)
                if not validity[0]:
                    out = ""
                    for k, v in validity[1].items():
                        out += ("File: {f} Key: {key} "
                                "{check}\n\n".format(key=k,
                                                     check=v,
                                                     f=fullname)
                                )
                    self.fail(out)
