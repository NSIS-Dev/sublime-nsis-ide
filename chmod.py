import os, stat, sublime, sublime_plugin

# Configuration
pkg = 'NSIS Developer'
script = sublime.packages_path() + '/' + pkg + '/Support/makensis.sh'

def plugin_loaded():
    from package_control import events

    # chmod +x <script>
    if (events.install(pkg) or events.post_upgrade(pkg)) and os.name is 'posix' or 'mac':
        st = os.stat(script)
        os.chmod(script, st.st_mode | stat.S_IEXEC)