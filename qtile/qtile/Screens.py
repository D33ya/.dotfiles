from libqtile import bar
from libqtile.config import Screen
from screeninfo import get_monitors

from widgets import volume, bluetooth, status, power, clock, sep, group, space

my_widgets = [
    sep,
    status,
    space,
    group,
    space,
    volume,
    bluetooth,
    power,
    clock,
    sep
]

if len(get_monitors()) == 2:
    screens = [
        Screen(top=bar.Bar(
            my_widgets,
            24,
            margin=[4, 4, 0, 4],
        )
        ),
        Screen(top=bar.Bar(
            my_widgets,
            24,
            margin=[4, 4, 0, 4]
        )
        )
    ]
else:
    screens = [
        Screen(top=bar.Bar(
            my_widgets,
            24,
            margin=[4, 4, 0, 4],
        )
        )
    ]
