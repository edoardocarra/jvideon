#!/usr/bin/python

import os

def import_or_install_pip():
    try:
        __import__('pip')
    except ImportError:
        os.system("easy_install pip")  

def import_or_install(package):
    try:
        __import__(package)
    except ImportError:
        pip.main(['install', package])   

import_or_install_pip()
import_or_install('json')
import_or_install('numpy')
import_or_install('scipy')
