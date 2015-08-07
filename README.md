# Sublime Text Packages for NSIS

[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)](http://opensource.org/licenses/MIT)
[![Apache License](https://img.shields.io/badge/license-Apache-orange.svg?style=flat-square)](https://www.apache.org/licenses/LICENSE-2.0)
[![Travis](https://img.shields.io/travis/NSIS-Dev/sublime-nsis.svg?style=flat-square)](https://travis-ci.org/NSIS-Dev/sublime-nsis)

A collection of useful [NSIS](http://nsis.sourceforge.net) packages for [Sublime Text](http://www.sublimetext.com/). 

This package has been tested and approved for all Sublime Text versions.

### Includes

* [Syntax Highlighting](https://github.com/SublimeText/NSIS)
* [Syntax Highlighting for language files](https://github.com/idleberg/NSIS-Language-File-Sublime-Text)
* [Auto-completion for NSIS syntax, Useful Headers, bundled plug-ins](https://github.com/idleberg/NSIS-Sublime-Text)
* [Auto-completion for third party plug-ins and macros](https://github.com/idleberg/NSIS-Sublime-Text-Addons)
* [Drunken NSIS auto-completion](https://github.com/idleberg/Drunken-NSIS)
* [Build System](http://nsis.sourceforge.net/Sublime_Text_Build_System_for_NSIS)
* [Context menu for online scripting reference](https://github.com/idleberg/NSIS-Sublime-Text-Menu)

## Installation

### Package Control

The easiest way to install is via [Package Control](http://wbond.net/sublime_packages/package_control/):

1. Add our Package Control repository `https://nsis-dev.github.io/sublime-nsis/repository.json`
2. “*Install package*” from the Command Palette (<kbd>Super</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>)
3. Select *NSIS Developer* and press <kbd>Enter</kbd>

With [auto_upgrade](http://wbond.net/sublime_packages/package_control/settings/) enabled, Package Control will keep all installed packages up-to-date!

### GitHub

1. Change to your Sublime Text `Packages` directory
2. Clone repository `git clone https://github.com/NSIS-Dev/sublime-nsis.git 'NSIS Developer'`

### Windows Installer

1. Download the [latest release](https://github.com/NSIS-Dev/sublime-nsis/releases)
2. Compile `Support/installer.nsi`
3. Run setup and follow instructions

### License

This package is largely released under [The MIT License](http://opensource.org/licenses/MIT) except NSIS language definitions and Windows build system, both released under the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).