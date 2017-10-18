#
# linter.py
# Linter for SublimeLinter3, a code checking framework for Sublime Text 3
#
# Written by Jan T. Sott
# Copyright (c) 2016, 2017 Jan T. Sott
#
# https://github.com/idleberg/SublimeLinter-contrib-makensis
#
# License: MIT
#


"""This module exports the Makensis plugin class."""

from SublimeLinter.lint import Linter, util


class Makensis(Linter):

    """Provides an interface to the makensis executable."""

    cmd = ('makensis', '-V2', '@', '-X!error "Abort linting"')
    version_args = '-VERSION'
    version_re = r'(?P<version>\d+\.\d+(\.\d+)?)'
    version_requirement = '>= 3.02.1'

    syntax = 'nsis'
    regex = (
        r'((?P<warning>warning): (?P<warnMessage>.*) \(.*:(?P<warnLine>\d+)\)$'
        r'|(?P<message>[^\r?\n]+)\r?\n(?P<error>Error) in script "[^"]+" on line (?P<line>\d+) -- aborting creation process$)'
    )
    multiline = True
    error_stream = util.STREAM_BOTH
    line_col_base = (1, 1)

    def split_match(self, match):
        """
        Extract and return values from match.

        We override this method so that general errors that do not have
        a line number can be placed at the beginning of the code.

        """

        match, line, col, error, warning, message, near = super().split_match(match)

        if message is None:
            message = str(match.groupdict()["warnMessage"])
            line = int(match.groupdict()["warnLine"]) - 1

        return match, line, col, error, warning, message, near
