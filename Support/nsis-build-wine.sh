#!/bin/bash

# The MIT License (MIT)
# Copyright (c) 2014-2016 Jan T. Sott, Derek Willian Stavis
#
# This script builds NSIS scripts using makensis on Wine
#
# https://github.com/idleberg/sublime-makensis

# Set path
PATH=/usr/bin:/usr/local/bin:/opt/local/bin:/bin:$PATH

# Set arguments
if [[ $1 != '-WX' ]]
then
    ARGUMENTS="--"
    SCRIPT=\"$@\"
else
    ARGUMENTS="$1 --"
    SCRIPT=\"${@:2}\"
fi

echo "Detecting Wine"

# Detect Wine then
command -v wine >/dev/null 2>&1 || { 
  echo >&2 "Error: Wine not found"
  exit 127
}

# Get Program Files path via Wine command prompt
PROGRAMS_WIN=$(wine cmd /c 'echo %PROGRAMFILES%' 2>/dev/null)

echo "Converting Windows file path to POSIX"

# Translate windows path to absolute POSIX path
PROGRAMS_UNIX=$(winepath -u "${PROGRAMS_WIN}" 2>/dev/null)

echo "Detecting makensis.exe"

# Get makensis path
MAKENSIS=$(printf %q "${PROGRAMS_UNIX%?}/NSIS/makensis.exe")

echo "Running makensis.exe"
echo
eval wine $MAKENSIS $ARGUMENTS $SCRIPT
