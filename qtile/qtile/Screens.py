from libqtile import bar
from libqtile.config import Screen

from widgets import volume, bluetooth, status, power, clock, sep, group, space

my_widgets = [sep, status, space, group, space, volume, bluetooth, power, clock, sep]

screens = [
    Screen(
        top=bar.Bar(
            my_widgets,
            24,
            margin=[4, 4, 0, 4],
        )
    ),
    Screen(top=bar.Bar(my_widgets, 24, margin=[4, 4, 0, 4])),
]
