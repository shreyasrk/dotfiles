#!/usr/bin/python
"""
    Script to remove unused eggs in /jiva_buildout/eggs
    Parses jiva_app_versions.cfg and linux_versions.cfg
"""

__author__ = 'Avinash Yenikapati'

import os
import platform
import shutil
from ConfigParser import SafeConfigParser

parser = SafeConfigParser()

eggs_path = os.path.join(os.getcwd(), 'eggs')
all_eggs = os.listdir(eggs_path)

def get_app_versions():
    etc_path = os.path.join(os.getcwd(), 'etc')
    app_versions_path = os.path.join(etc_path, 'jiva_app_versions.cfg')
    cfg_versions = get_cfg_versions(app_versions_path)
    return cfg_versions

def get_cfg_versions(path):  
    parser.read(path)
    repo_list = parser.options('versions')
    cfg_versions = {repo: parser.get('versions', repo) for repo in repo_list}
    return cfg_versions

def check_duplicates(cfg_versions):
    actual_versions = {}
    for egg in all_eggs:
        actual_versions.setdefault(egg.split('-')[0], []).append(egg)
    dup_dirs_list = [egg for repo, versions in cfg_versions.iteritems() for egg in actual_versions.get(repo, []) if '-' + versions + '-' not in egg]
    return dup_dirs_list

def get_os_versions():
    modules_path = os.path.join(os.getcwd(), 'modules')
    build_path = os.path.join(modules_path, 'zope_build')
    files_path = os.path.join(build_path, 'files')
    os_versions_path = os.path.join(files_path, platform.system().lower() + '_versions.cfg')
    cfg_versions = get_cfg_versions(os_versions_path)
    return cfg_versions

def remove_folders(cfg_versions):
    dup_dirs = check_duplicates(cfg_versions)
    for directory in dup_dirs:
        folder_path = os.path.join(eggs_path, directory)
        if os.path.exists(folder_path):
            print "Removing ", folder_path
            shutil.rmtree(folder_path)

    print "Task completed. Don't forget to run buildout again to sync latest eggs!"
    
if __name__ == '__main__':
    app_cfg_dict = get_app_versions()
    remove_folders(app_cfg_dict)
    
    os_cfg_dict = get_os_versions()
    remove_folders(os_cfg_dict)


