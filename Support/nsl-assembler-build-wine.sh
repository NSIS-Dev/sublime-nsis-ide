#!/bin/bash

# Set path
PATH=/usr/bin:/usr/local/bin:/opt/local/bin:/bin:$PATH

echo "Detecting Wine"

command -v wine >/dev/null 2>&1 || { 
    echo >&2 "Error: Wine not found"
    exit 127
}

# Get Program Files path via Wine command prompt
PROGRAMS_WIN=$(wine cmd /c 'echo %PROGRAMFILES%' 2>/dev/null)

echo "Converting Windows file path to POSIX"

# Translate windows path to absolute unix path
PROGRAMS_UNIX=$(winepath -u "${PROGRAMS_WIN}" 2>/dev/null)

echo "Detecting nsL.jar"

# Get path to nsLJar
NSL_JAR=$(printf %q "${PROGRAMS_UNIX%?}/NSIS/NSL/nsL.jar")

echo "Running Java"
echo

eval java -jar "$NSL_JAR" /nomake /nopause $@