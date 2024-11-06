from re import findall
from os import path
from io import open
from qtile_extras.widget.decorations import PowerLineDecoration, RectDecoration


THEMES = path.expanduser('~/.config/qtile/themes/')

powerline = {
    "decorations": [
        PowerLineDecoration(

        )
    ]
}
decoration_group = {
    "decorations": [
        RectDecoration(
            radius=10,
            padding_y=15,
            group=True,
            filled=True,
            use_widget_background=True,
            background="#00000000",
        )
    ],
    # 'padding': 10,
}


class themer:
    def __init__(self, path):
        theme_file = open(path, 'r')
        self._theme = dict(
            findall(r'[^!]\*?(\w*)\:\s*#?(.*)', theme_file.read())
        )
        theme_file.close()

        self._widgets = {
            'background': self.theme["color5"],
            'foreground': self._theme["foreground"],
            'active': self._theme["foreground"],
            'font': "JetBrains Mono Nerd Font",
            'fontsize': 16,
            'padding': 10,
            'border_color': self._theme["foreground"],
            # **powerline,
            # **decoration_group,
        }

        self._layouts = {
            'border_focus': self._theme['color2'],
            'border_normal': self._theme['foreground'],
            'border_width': 2,
            'margin': 10,
        }

    @ property
    def layouts(self):
        return self._layouts

    @ property
    def widgets(self):
        return self._widgets

    @ property
    def theme(self):
        return self._theme


theme_list = {
    'flat': themer(THEMES + 'flat.txt'),
    'venom': themer(THEMES + 'venom.txt'),
    'cyberdream': themer(THEMES + 'cyberdream.txt'),
}

theme = theme_list[
    # 'venom'
    # 'flat'
    'cyberdream'
]
