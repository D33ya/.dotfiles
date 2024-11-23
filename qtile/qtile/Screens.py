from libqtile import bar, widget
from libqtile.lazy import lazy
from qtile_extras import widget as extras
from libqtile.config import Screen
from qtile_extras.popup.toolkit import PopupRelativeLayout, PopupImage, PopupText
from qtile_extras.widget.groupbox2 import GroupBoxRule as Rule
from catppuccin import PALETTE
from screeninfo import get_monitors

num_of_screens = len(get_monitors())

colors = PALETTE.macchiato.colors

screens = [
    Screen(
        top=bar.Bar(
            [
                extras.GroupBox2(),
                widget.Sep(),
                widget.Systray(),
                widget.Sep(),
                widget.Spacer(),
                widget.Pomodoro(),
                extras.PulseVolumeExtra(),
                extras.Bluetooth(),
                extras.UPowerWidget(battery_name="BAT1"),
                widget.Clock(),
            ],
            32,
            background=colors.crust.hex,
        ),
        wallpaper="/home/d33ya/Pictures/Pictures/Wallpaper/wallhaven-8586my.png",
    )
]

for screen in range(num_of_screens):
    screens.append(
        Screen(
            top=bar.Bar([extras.GroupBox2()], 24),
            wallpaper="/home/d33ya/Pictures/Pictures/Wallpaper/wallhaven-8586my.png",
        )
    )
