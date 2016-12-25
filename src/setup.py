#!/usr/bin/env python

# Written by Bram Cohen, and modified by Steven Shiau, Thomas Tsai, Ceasar Sun,
# see LICENSE.txt for license information

import sys
assert sys.version >= '2', "Install Python 2.0 or greater"
from distutils.core import setup, Extension
import OCSBttrack

setup(
    name = "OCSBttrack",
    version = OCSBttrack.version,
    author = "Steven Shiau, Thomas Tsai, Ceasar Sun, et. al.",
    author_email = "<steven@clonezilla.org>",
    url = "http://clonezilla.org",
    license = "MIT",
    
    packages = ["OCSBttrack","OCSBttrack.BT1"],

    scripts = ["ocs-bttrack.py", "btcompletedir.py", "btmakemetafile.py"],
    )
