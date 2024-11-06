from Keys import keys, mod
from libqtile.config import Key, Group, ScratchPad, DropDown
from libqtile.lazy import lazy
"""
ideas for Groups.
-coding
    neovim on the left half, and stacked windows on the right, like web browser
    terminal, anything else i need for referance while coding.

-Web
    fullscreen Browser for youtube, and general surfing.

-Social
    Fullscreen Discord.

-System monitoring
    windows running Btop, Neofetch, Terminal.

    """

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
groups.append(
    ScratchPad("scratchpad", [
        DropDown("term", "kitty", width=0.7, height=0.6, x=0.15, y=0.15),
        DropDown("python", "kitty ipython", width=0.8,
                 height=0.8, y=0.1, opacity=0.9),
        DropDown('btop', 'kitty btop', width=.8, height=.8, y=.1),
        DropDown('qtile shell', 'kitty qtile shell',
                 width=0.7, height=0.6, x=0.15, y=0.15),
    ]),
)
