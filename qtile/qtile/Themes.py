from io import open
from os import path
from re import findall
from typing import *

from libqtile.lazy import lazy
from qtile_extras.widget.decorations import PowerLineDecoration, RectDecoration

powerline = {"decorations": [PowerLineDecoration()]}
# decoration_group = {
#     "decorations": [
#         RectDecoration(
#             radius=10,
#             padding_y=15,
#             group=True,
#             filled=True,
#             use_widget_background=True,
#             background=themer.colors[0],
#         )
#     ],
#     # 'padding': 10,
# }


class themer:
    def __init__(self):
        cache = "/home/d33ya/.cache/wal/colors"

        self.__colors: List[str] = []
        with open(cache, "r") as file:
            for i in range(16):
                self.__colors.append(file.readline().strip())
        self.__colors.append("#ffffff")

        self._widgets = {
            "background": self.__colors[0],
            "foreground": self.__colors[1],
            "active": self.__colors[3],
            "font": "JetBrains Mono Nerd Font",
            "fontsize": 16,
            "padding": 10,
            "border_color": self.__colors[2],
            # **powerline,
            # **decoration_group,
        }

        self._layouts = {
            "border_focus": self.__colors[3],
            "border_normal": self.__colors[2],
            "border_width": 2,
            "margin": 10,
        }

        self.__decorations_group = {
            "decorations": [
                RectDecoration(
                    radius=10,
                    padding_y=15,
                    group=True,
                    filled=True,
                    use_widget_background=True,
                    background=self.__colors[0],
                )
            ],
            # 'padding': 10,
        }

    @property
    def layouts(self):
        return self._layouts

    @property
    def widgets(self):
        return self._widgets

    @property
    def colors(self) -> List[str]:
        return self.__colors

    @property
    def decoration_group(self):
        return self.__decorations_group


theme = themer()
