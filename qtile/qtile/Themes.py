from io import open
from os import path
from re import findall

from libqtile.lazy import lazy
from qtile_extras.widget.decorations import PowerLineDecoration, RectDecoration

colors = []


def load_colors(cache):
    with open(cache, "r") as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append("#ffffff")
    lazy.reload()


load_colors(cache)


powerline = {"decorations": [PowerLineDecoration()]}
decoration_group = {
    "decorations": [
        RectDecoration(
            radius=10,
            padding_y=15,
            group=True,
            filled=True,
            use_widget_background=True,
            background=colors[0],
        )
    ],
    # 'padding': 10,
}


class themer:
    def __init__(self, path):
        cache = "/home/d33ya/.cache/wal/colors"
        self._theme = dict(findall(r"[^!]\*?(\w*)\:\s*#?(.*)", theme_file.read()))
        theme_file.close()

        self._widgets = {
            "background": self.theme["color5"],
            "foreground": self._theme["foreground"],
            "active": self._theme["foreground"],
            "font": "JetBrains Mono Nerd Font",
            "fontsize": 16,
            "padding": 10,
            "border_color": self._theme["foreground"],
            # **powerline,
            # **decoration_group,
        }

        self._layouts = {
            "border_focus": "#8aadf4",
            "border_normal": "#b7bdf8",
            "border_width": 2,
            "margin": 10,
        }

    @property
    def layouts(self):
        return self._layouts

    @property
    def widgets(self):
        return self._widgets

    @property
    def theme(self):
        return self._theme
