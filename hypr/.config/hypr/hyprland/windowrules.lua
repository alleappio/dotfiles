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
hl.window_rule({ float = true, center = true, pin = true, match = { class = '^.*float$' } })

local stuff_in_workspaces = {
    { 'Alacritty', 'com.mitchellh.ghostty', 'kitty', 'foot'}, -- ws 1
    { 'zen', 'librewolf', 'firefox', 'qutebrowser', 'helium' }, -- ws 2
    { 'BambuStudio', 'orca-slicer', 'jetbrains-studio' }, -- ws 3
    { 'org.telegram.desktop'}, -- ws 4
    { 'org.polymc.PolyMC', 'Minecraft*'}, -- ws 5
    {}, -- ws 6
    {}, -- ws 7
    {}, -- ws 8
    { 'rviz2' }, -- ws 9
    { 'Spotify' } -- ws 10
}

for index, classes in ipairs(stuff_in_workspaces) do
    for _, class in ipairs(classes) do
        hl.window_rule({ workspace = index, match = { class = class } })
    end
end
