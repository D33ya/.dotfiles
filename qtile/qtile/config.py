# TODO:
#   * Compleate widget layout and functionality for the bar.
#   * Configure Screens to work between different monitor setups.
#   * Quick theme changing with hotkeys.
#   * Build my own widget to track MNUFC games.
#   * Configure my layouts, and groups.
#   * Configure key bindings.

import os
import subprocess

from Groups import groups
from Keys import keys, mouse
from Layouts import floating_layout, init_layouts
from libqtile import hook, qtile

# from catppuccin import PALETTE
from qtile_extras.layout.decorations.borders import GradientBorder
from Screens import screens

# colors = PALETTE.macchiato.colors

layout_defaults = dict(
    border_focus=GradientBorder(
        # colours=[colors.green.hex, colors.maroon.hex, colors.red.hex],
        radial=False,
        points=[(0, 0), (1, 1)],
    ),
    # border_normal=colors.overlay0.hex,
    border_width=2,
    margin=8,
)

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=16,
    padding=4,
    margin=10,
    # background=PALETTE.macchiato.colors.crust.hex,
)

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
    subprocess.run(script)
