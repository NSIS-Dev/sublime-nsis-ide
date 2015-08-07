# NSIS Developer for Sublime Text

[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)](http://opensource.org/licenses/MIT)
[![Apache License](https://img.shields.io/badge/license-Apache-orange.svg?style=flat-square)](https://www.apache.org/licenses/LICENSE-2.0)
[![GitHub](https://img.shields.io/github/release/NSIS-Dev/sublime-nsis.svg?style=flat-square)](https://github.com/NSIS-Dev/sublime-nsis/releases)
[![Travis](https://img.shields.io/travis/NSIS-Dev/sublime-nsis.svg?style=flat-square)](https://travis-ci.org/NSIS-Dev/sublime-nsis)

A collection of useful [NSIS](http://nsis.sourceforge.net) packages for [Sublime Text](http://www.sublimetext.com/). 

This package has been tested and approved for all Sublime Text versions.

### Includes

* [NSIS Grammar](https://github.com/SublimeText/NSIS)
* [NSIS Language File Grammar](https://github.com/idleberg/NSIS-Language-File-Sublime-Text)
* [NSIS Completions](https://github.com/idleberg/NSIS-Sublime-Text)
* [Drunken NSIS Completions](https://github.com/idleberg/Drunken-NSIS)
* [Build System](https://github.com/idleberg/Drunken-NSIS)

## Installation

### Package Control

The easiest way to install is via [Package Control](http://wbond.net/sublime_packages/package_control/).

1. Add our repository `https://nsis-dev.github.io/sublime-nsis/repository.json`
2. Choose “*Install package*” from the Command Palette (<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>)
3. Select “*NSIS Developer*” and press <kbd>Enter</kbd>

With [auto_upgrade](http://wbond.net/sublime_packages/package_control/settings/) enabled, Package Control will keep all installed packages up-to-date!

### GitHub

1. Change to your Sublime Text `Packages` directory
2. `git clone https://github.com/NSIS-Dev/sublime-nsis.git 'NSIS Developer'`

### Windows Installer

1. Download the [latest release](https://github.com/NSIS-Dev/sublime-nsis/releases)
2. Compile `Support/installer.nsi`
3. Run setup and follow instructions

## License

This package is largely released under [The MIT License](http://opensource.org/licenses/MIT), except NSIS language definitions and Windows build system, both released under the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).