from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras import widget as extras
from qtile_extras.popup.toolkit import PopupImage, PopupRelativeLayout, PopupText
from qtile_extras.widget.groupbox2 import GroupBoxRule as Rule
from Themes import theme
from widgets import bluetooth, clock, group, network, power

# num_of_screens = len(get_monitors())

# colors = PALETTE.macchiato.colors

screens = [
    Screen(
        top=bar.Bar(
            [
                group,
                widget.Spacer(),
                widget.StatusNotifier(),
                widget.Systray(),
                # widget.Wttr(
                # location={"Minneapolis": "minneapolis"},
                # ),
                clock,
                extras.ALSAWidget(
                    mode="icon",
                    theme_path="~/.config/qtile/icons/volume/memory/",
                    icon_size=20,
                ),
                widget.Backlight(
                    brightness_file="/sys/class/backlight/intel_backlight/brightness",
                    max_brightness_file="/sys/class/backlight/intel_backlight/max_brightness",
                ),
                extras.WiFiIcon(
                    update_interval=5,
                    fontsize=10,
                    padding=9,
                    # padding_x=4,
                    interface="wlo1",
                    active_colour=theme.colors[1],
                ),
                bluetooth,
                power,
            ],
            32,
            background=theme.colors[0],
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(),
                group,
            ],
            32,
            background=theme.colors[0],
        ),
    ),
]

# for screen in range(num_of_screens):
#     screens.append(
#         Screen(
#             top=bar.Bar([extras.GroupBox2()], 24),
#             # wallpaper="/home/d33ya/Pictures/Pictures/Wallpaper/wallhaven-8586my.png",
#         )
#     )
