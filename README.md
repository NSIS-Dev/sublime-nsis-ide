# NSIS Developer for Sublime Text 3

[![The MIT License](https://img.shields.io/badge/license-MIT-orange.svg?style=flat-square)](http://opensource.org/licenses/MIT)
[![Apache License](https://img.shields.io/badge/license-Apache-orange.svg?style=flat-square)](https://www.apache.org/licenses/LICENSE-2.0)
[![GitHub](https://img.shields.io/github/release/NSIS-Dev/sublime-nsis.svg?style=flat-square)](https://github.com/NSIS-Dev/sublime-nsis/releases)
[![David](https://img.shields.io/david/dev/NSIS-Dev/sublime-nsis.svg?style=flat-square)](https://david-dm.org/NSIS-Dev/sublime-nsis#info=devDependencies)
[![Travis](https://img.shields.io/travis/NSIS-Dev/sublime-nsis.svg?style=flat-square)](https://travis-ci.org/NSIS-Dev/sublime-nsis)
[![Gitter](https://img.shields.io/badge/chat-Gitter-ff69b4.svg?style=flat-square)](https://gitter.im/NSIS-Dev/SublimeText)

A collection of useful [NSIS](http://nsis.sourceforge.net) packages for [Sublime Text](http://www.sublimetext.com/).

![Screenshot](https://raw.githubusercontent.com/NSIS-Dev/sublime-nsis/master/screenshot.png)

This package has been tested and approved for Sublime Text 3 ([Build 3103](http://www.sublimetext.com/blog/articles/sublime-text-3-build-3103) or higher).

### Includes

* [NSIS Grammar](https://github.com/SublimeText/NSIS)
* [NSIS Language File Grammar](https://github.com/idleberg/sublime-nlf)
* [NSIS Completions](https://github.com/idleberg/sublime-nsis)
* [Drunken NSIS Completions](https://github.com/idleberg/sublime-drunken-nsis)
* [Build System](https://github.com/idleberg/sublime-makensis)

## Installation

### Package Control

The easiest way to install is via [Package Control](https://packagecontrol.io/).

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

## Building

Before using this plugin, you must ensure that `makensis` is installed on your system. To install `makensis, do the following:

### Windows

With [NSIS](https://sourceforge.net/p/nsis) installed, make sure `makensis` is in your [PATH environmental variable](http://superuser.com/a/284351/195953).

### Linux

Install `makensis` from your distribution's default package manager, for example:

```bash
# Debian
sudo apt-get install nsis

# Red Hat
sudo dnf install nsis
```

### Mac OS X

Install `makensis` through Homebrew:

```bash
# Homebrew
brew install nsis

# MacPorts - not maintained, not recommended!
ports install nsis
```

## License

This package is largely released under [The MIT License](http://opensource.org/licenses/MIT), except NSIS language definitions and Windows build system, both released under the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).