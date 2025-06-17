from libqtile import widget
from qtile_extras import widget as extra
from qtile_extras.widget.decorations import PowerLineDecoration, RectDecoration
from qtile_extras.widget.groupbox2 import GroupBoxRule, ScreenRule
from Themes import theme

# Dependencies:
#   dbust_fast
#   iwd


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
    ],
}


powerline = {
    "decorations": [PowerLineDecoration()],
    "padding": 18,
}

# pong = extra.Pong()


def set_label(rule, box):
    if box.focused:
        rule.text = "◉"
    elif box.occupied:
        rule.text = "◎"
    else:
        rule.text = "○"

    return True


volume = widget.Volume(
    emoji=True,
    emoji_list=["", "", "", ""],
    scroll=True,
    width=20,
)

network = extra.IWD()

bluetooth = extra.Bluetooth(
    default_text="",
    fontsize=20,
    default_timeout=10,
)

status = extra.StatusNotifier()

power = extra.UPowerWidget(
    battery_name="BAT1",
    # padding_x=4,
    border_charge_colour=theme.colors[2],
    border_color=theme.colors[2],
    fill_charge=theme.colors[1],
)

clock = widget.Clock(
    format="%A %b %-d %H:%M",
)

space = widget.Spacer()

sep = widget.Sep()

group = extra.GroupBox2(
    margin=2,
    padding=2,
    fontsize=18,
    rules=[
        GroupBoxRule().when(func=set_label),
        GroupBoxRule(text_colour=theme.colors[1]).when(screen=ScreenRule.ANY),
        GroupBoxRule(text_colour=theme.colors[8]).when(screen=ScreenRule.OTHER),
        GroupBoxRule(text_colour=theme.colors[8]).when(),
    ],
)
