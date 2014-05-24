# Sublime Text Packages for NSIS [![Build Status](https://secure.travis-ci.org/NSIS-Dev/Sublime-Text-Packages.png)](http://travis-ci.org/NSIS-Dev/Sublime-Text-Packages)

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

### Windows Installer

Before you continue, make sure you have [Git installed](http://git-scm.com/download/) and are familiar with its [basics](http://git-scm.com/documentation). We are going to assume that you have [NSIS 2.46](http://nsis.sourceforge.net/Download) (or higher) installed.

#### Batch file

1. Clone the repository `git clone https://github.com/NSIS-Dev/Sublime-Text-Packages.git Sublime-Text-Packages`
2. Change directory to clone `cd Sublime-Text-Packages`
3. Run `make` to configure submodules and compile installer


#### Manual Installation

1. Open your command-line interface (e.g. `cmd.exe`) and perform the following commands

    git clone https://github.com/NSIS-Dev/Sublime-Text-Packages.git Sublime-Text-Packages
    cd Sublime-Text-Packages
    git submodule init
    git submodule update

2. Compile `installer.nsi`, run the executable and follow instructions.
