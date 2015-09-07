#!/usr/bin/python

import os
import re
import shutil

def parse_cfg_file():
    egg_list = []
    repo_list = []
    cfg = open(os.getcwd() + '/etc/jiva_app_versions.cfg', 'r')

    for i, line in enumerate(cfg):
        if i >= 4:
            if not line.startswith('#'):
                egg_list.append("-".join(line.replace("\n", "").strip().split(' = ')) + '-py2.7.egg')
                repo_list.append(line.replace("\n", "").split(' = ')[0])

    return egg_list, repo_list

def remove_duplicates():
    eggs_path = os.getcwd() + '/eggs/'
    eggs_dir = os.listdir(eggs_path)
    eggs_list, repo_list = parse_cfg_file()

    for repo in repo_list:
        valid_dir = [f for f in eggs_list if re.match(repo, f)][0]
        dup_dirs = [f for f in eggs_dir if re.match(repo + '-', f) and not
                re.match(valid_dir, f)]
        for dir in dup_dirs:
            print "Removing ", dir
            shutil.rmtree(eggs_path + dir)

if __name__ == '__main__':
    remove_duplicates()


