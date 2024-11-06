from qtile_extras.widget.groupbox2 import GroupBoxRule, ScreenRule
from qtile_extras import widget
from Themes import theme as qtile_theme
from qtile_extras.widget.decorations import (
    PowerLineDecoration,
    RectDecoration
)

theme = qtile_theme.theme

rect = {
    "decorations": [
        RectDecoration(
            radius=10,
            padding_y=0,
            group=True,
            filled=True,
            use_widget_background=True,
            clip=True,
        ),
    ], }

powerline = {
    "decorations": [
        PowerLineDecoration()
    ],
    'padding': 18,
}


def set_label(rule, box):
    if box.focused:
        rule.text = "◉"
    elif box.occupied:
        rule.text = "◎"
    else:
        rule.text = "○"

    return True


volume = widget.Volume(
    background=theme['background'],
    emoji=True,
    emoji_list=['', '', '', ''],
    scroll=True,
    width=20,
)

bluetooth = widget.Bluetooth(
    background=theme['background'],
    default_text='',
)

status = widget.StatusNotifier(
    background=theme['background'],
)

power = widget.UPowerWidget(
    battery_name='BAT1',
    # padding_x=4,
    background=theme['background'],
)

clock = widget.Clock(background=theme['background'])

space = widget.Spacer(
    background=theme['background'],

)

sep = widget.Sep(
    background=theme['background'],
    foreground=theme['background'],
)

group = widget.GroupBox2(
    margin=2,
    padding=5,
    rules=[
        GroupBoxRule().when(func=set_label),
        GroupBoxRule(text_colour=theme["color3"]).when(
            screen=ScreenRule.THIS),
        GroupBoxRule(text_colour=theme["color2"]).when(
            screen=ScreenRule.OTHER),
        GroupBoxRule(text_colour=theme["color2"]).when()
    ],
    background=theme['background'],
)
