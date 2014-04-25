# Based on the Stack Overflow search plug-in by Eric Martel (emartel@gmail.com / www.ericmartel.com)

import sublime
import sublime_plugin

import subprocess
import webbrowser

def SearchFor(text):
    url = 'https://github.com/NSIS-Dev/Documentation/blob/master/Reference/' + text.replace(' ','%20') + ".markdown"
    webbrowser.open_new_tab(url)

class NsisSearchSelectionCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        for selection in self.view.sel():
            # if the user didn't select anything, search the currently highlighted word
            if selection.empty():
                text = self.view.word(selection)

            text = self.view.substr(selection)
            
            SearchFor(text)