from Keys import keys
from libqtile.config import Group, ScratchPad, DropDown
from libqtile.config import EzKey as Key
from libqtile.lazy import lazy
from screeninfo import get_monitors

num_of_screens = len(get_monitors())
num_of_groups = 4
total_groups = num_of_groups * num_of_screens

group_names = ""

for i in range(total_groups):
    group_names = group_names + str(i + 1)


groups = [Group(name=i, persist=True, init=True) for i in group_names]

# map = {"1": ["1", "2"], "2": ["3", "4"], "3": ["5", "6"], "4": ["7", "8"]}

for i in groups:
    # call_groups = map[i.name]

    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                f"M-{i.name}",
                lazy.group[i.name].toscreen(),
                # lazy.group[call_groups[1]].toscreen(1),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                f"M-S-{i.name}",
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown("term", "kitty", width=0.7, height=0.6, x=0.15, y=0.15),
            DropDown(
                "python", "kitty ipython", width=0.8, height=0.8, y=0.1, opacity=0.9
            ),
            DropDown("btop", "kitty btop", width=0.8, height=0.8, y=0.1),
            DropDown(
                "qtile shell",
                "kitty qtile shell",
                width=0.7,
                height=0.6,
                x=0.15,
                y=0.15,
            ),
        ],
    ),
)
