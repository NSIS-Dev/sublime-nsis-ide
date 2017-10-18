# NSIS IDE for Sublime Text 3

[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)](http://opensource.org/licenses/MIT)
[![Apache License](https://img.shields.io/badge/license-Apache-orange.svg?style=flat-square)](https://www.apache.org/licenses/LICENSE-2.0)
[![GitHub](https://img.shields.io/github/release/NSIS-Dev/sublime-nsis-ide.svg?style=flat-square)](https://github.com/NSIS-Dev/sublime-nsis-ide/releases)
[![David](https://img.shields.io/david/dev/NSIS-Dev/sublime-nsis-ide.svg?style=flat-square)](https://david-dm.org/NSIS-Dev/sublime-nsis-ide#info=devDependencies)
[![Travis](https://img.shields.io/travis/NSIS-Dev/sublime-nsis-ide.svg?style=flat-square)](https://travis-ci.org/NSIS-Dev/sublime-nsis-ide)
[![Gitter](https://img.shields.io/badge/chat-Gitter-ff69b4.svg?style=flat-square)](https://gitter.im/NSIS-Dev/SublimeText)

A collection of useful [NSIS](http://nsis.sourceforge.net) packages for [Sublime Text 3](http://www.sublimetext.com/) (Build 3084 or higher).

![Screenshot](https://raw.githubusercontent.com/NSIS-Dev/sublime-nsis-ide/master/screenshot.png)

### Includes

* [NSIS Grammar](https://github.com/SublimeText/NSIS)
* [NSIS Language File Grammar](https://github.com/idleberg/sublime-nlf)
* [NSIS Completions](https://github.com/idleberg/sublime-nsis)
* [NSIS Plug-in Completions](https://github.com/idleberg/sublime-nsis-plugins)
* [Drunken NSIS Completions](https://github.com/idleberg/sublime-drunken-nsis)
* [Build System](https://github.com/idleberg/sublime-makensis)
* [Linter](https://github.com/idleberg/SublimeLinter-contrib-makensis)
* [nsL Assembler](https://github.com/idleberg/sublime-nsl-assembler)

## Installation

### Package Control

The easiest way to install is via [Package Control](https://packagecontrol.io/).

1. Add our repository `https://nsis-dev.github.io/sublime-nsis-ide/repository.json`
2. Choose “*Install package*” from the Command Palette (<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>)
3. Select “*NSIS IDE*” and press <kbd>Enter</kbd>

With [auto_upgrade](http://wbond.net/sublime_packages/package_control/settings/) enabled, Package Control will keep all installed packages up-to-date!

### GitHub

Change to your Sublime Text `Packages` directory, then clone this repository:

```bash
$ git clone https://github.com/NSIS-Dev/sublime-nsis-ide.git 'NSIS IDE'
```

## Building

Before using this plugin, you must ensure that `makensis` is installed on your system. To install `makensis`, do the following:

### Windows

With [NSIS](https://sourceforge.net/p/nsis) installed, make sure `makensis` is in your [PATH environmental variable](http://superuser.com/a/284351/195953).

### Linux

Install `makensis` from your distribution's default package manager, for example:

```bash
# Debian
$ sudo apt-get install nsis

# Red Hat
$ sudo dnf install nsis
```

### macOS

Install `makensis` through Homebrew:

```bash
# Homebrew
$ brew install nsis

# MacPorts - not maintained, not recommended!
$ ports install nsis
```

## Linting

SublimeLinter 3 must be [installed](http://sublimelinter.readthedocs.org/en/latest/installation.html) in order to use the linter.

In order for `makensis` to be executed by SublimeLinter, you must [ensure that its path is available][path] to SublimeLinter. Before going any further, please read and follow the steps in [“Finding a linter executable”](http://sublimelinter.readthedocs.org/en/latest/troubleshooting.html#finding-a-linter-executable) through “Validating your PATH” in the documentation.

Use the [Command Palette](http://docs.sublimetext.info/en/latest/reference/command_palette.html) to set up your linting preferences, or to run the linter.

## Nightly Versions

With [Node](https://nodejs.org) installed, you can keep the package at bleeding edge. Simply run `yarn upgrade || npm update` in the folder of this package.

## License

This package is largely released under [The MIT License](http://opensource.org/licenses/MIT), except NSIS language definitions and Windows build system, both released under the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
