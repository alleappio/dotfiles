suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = 'suppress-maximize-events',
    match = { class = '.*' },

    suppress_event = 'maximize',
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = 'fix-xwayland-drags',
    match = {
        class = '^$',
        title = '^$',
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.window_rule({
    name = 'move-hyprland-run',
    match = { class = 'hyprland-run' },

    move = '20 monitor_h-120',
    float = true,
})

-- menus
hl.window_rule({ float = true, center = true, size = { 800, 600 }, pin = true, match = { class = '^(.*pavucontrol.*)$' } })
hl.window_rule({ float = true, center = true, size = { 800, 500 }, pin = true, match = { class = '^.*tui$' } })

hl.window_rule({ workspace = 1, match = { class = 'Alacritty' } })
hl.window_rule({ workspace = 1, match = { class = 'com.mitchellh.ghostty' } })
hl.window_rule({ workspace = 2, match = { class = 'firefox' } })
hl.window_rule({ workspace = 2, match = { class = 'zen' } })
hl.window_rule({ workspace = 2, match = { class = 'librewolf' } })
hl.window_rule({ workspace = 3, match = { class = 'BambuStudio' } })
hl.window_rule({ workspace = 9, match = { class = 'rviz2' } })
hl.window_rule({ workspace = 10, match = { class = 'Spotify' } })
