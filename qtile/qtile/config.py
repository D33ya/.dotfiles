import os
import subprocess

from Groups import groups
from Keys import keys, mouse
from Layouts import floating_layout, init_layouts
from libqtile import hook, qtile
from libqtile.lazy import LazyCall, lazy
from qtile_extras.layout.decorations.borders import GradientBorder
from Screens import screens

# from catppuccin import PALETTE
from Themes import theme

# requires image magick

layout_defaults = dict(
    border_focus=GradientBorder(
        colours=[theme.colors[4], theme.colors[5], theme.colors[6]],
        radial=False,
        points=[(0, 0), (1, 1)],
    ),
    border_normal=theme.colors[7],
    border_width=2,
    margin=8,
)

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=16,
    padding=4,
    margin=10,
    background=theme.colors[0],
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


@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run(script)


@hook.subscribe.user("color")
def hooked_function():
    script = os.path.expanduser("~/.config/qtile/icons/volume/memory/change_color.sh")
    subprocess.run(script)
