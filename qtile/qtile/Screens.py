from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras import widget as extras
from qtile_extras.popup.toolkit import PopupImage, PopupRelativeLayout, PopupText
from qtile_extras.widget.groupbox2 import GroupBoxRule as Rule

# num_of_screens = len(get_monitors())

# colors = PALETTE.macchiato.colors

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Spacer(),
                widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(),
            ],
            32,
            # background=colors.crust.hex,
        ),
        # wallpaper="/home/d33ya/Pictures/Pictures/Wallpaper/wallhaven-8586my.png",
    )
]

# for screen in range(num_of_screens):
#     screens.append(
#         Screen(
#             top=bar.Bar([extras.GroupBox2()], 24),
#             # wallpaper="/home/d33ya/Pictures/Pictures/Wallpaper/wallhaven-8586my.png",
#         )
#     )
