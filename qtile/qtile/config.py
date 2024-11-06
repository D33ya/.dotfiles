# TODO:
#   * Compleate widget layout and functionality for the bar.
#   * Configure Screens to work between different monitor setups.
#   * Quick theme changing with hotkeys.
#   * Build my own widget to track MNUFC games.
#   * Configure my layouts, and groups.
#   * Configure key bindings.

import os
import subprocess
from Keys import keys, mouse
from Groups import groups
from Layouts import floating_layout
from Screens import screens
from libqtile import qtile, hook
from Themes import theme
from Layouts import init_layouts

layout_defaults = theme.layouts

widget_defaults = theme.widgets

extension_defaults = widget_defaults.copy()

layouts = init_layouts(layout_defaults)

dgroups_key_binder = None

dgroups_app_rules = []  # type: list

follow_mouse_focus = False

bring_front_click = False

floats_kept_above = True

cursor_warp = False

auto_fullscreen = True

focus_on_window_activation = "smart"

reconfigure_screens = True

auto_minimize = True

wmname = "qtile"

# HOOK startup


@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([script])
