from libqtile import layout
from libqtile.config import Match, Rule


def init_layouts(layout_defaults):
    return [
        # layout.Columns(**layout_theme),
        layout.Spiral(**layout_defaults),
        # layout.Max(**layout_theme),
        # Try more layouts by unleashing below layouts.
        # layout.Stack(num_stacks=2),
        # layout.Bsp(**layout_theme),
        layout.Matrix(**layout_defaults),
        layout.MonadTall(**layout_defaults),
        layout.MonadWide(**layout_defaults),
        # layout.RatioTile(),
        layout.Tile(**layout_defaults),
        # layout.TreeTab(),
        # layout.VerticalTile(),
        # layout.Zoomy(),
    ]


floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="MLS"),
        Match(title="tasker"),
        Match(title="tasker2"),
        Match(wm_class="Bitwarden"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
