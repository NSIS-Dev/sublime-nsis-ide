#
# linter.py
# Linter for SublimeLinter3, a code checking framework for Sublime Text 3
#
# Written by Jan T. Sott
# Copyright (c) 2016 Jan T. Sott
#
# https://github.com/idleberg/SublimeLinter-contrib-makensis
#
# License: MIT
#


"""This module exports the Makensis plugin class."""

from SublimeLinter.lint import Linter, util
from sys import platform as _platform


class Makensis(Linter):

    """Provides an interface to the makensis executable."""

    if _platform == "win32":
        cmd = ('makensis', '/V2', '@', '/X!error "Abort linting"')
        version_args = '/VERSION'
        version_re = r'(?P<version>\d+\.\d+)'
        version_requirement = '>= 2.46'
    else:
        cmd = ('makensis', '-V2', '@', '-X!error "Abort linting"')

    syntax = 'nsis'
    regex = (
        # r'(?P<warning>warning): (?P<message>.*) \(.*:(?P<line>\d+)\)'
        r'(?P<message>[^\r?\n]+)\r?\n(?P<error>Error) in script "[^"]+" on line (?P<line>\d+) -- aborting creation process$'
    )
    multiline = True
    error_stream = util.STREAM_STDOUT
    line_col_base = (1, 1)
