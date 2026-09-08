require('hyprland.theme')

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,

        border_size = 1,

        col = {
            active_border = { colors = { primary_color } },
            inactive_border = { colors = { background_color } },
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = true,

        layout = 'dwindle',
    },

    dwindle = {
        preserve_split = true,
    },

    decoration = {
        rounding = 0,
        rounding_power = 0,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = false,
        },
    },

    animations = {
        enabled = false,
    },

    group = {
        auto_group = true,
        groupbar = {
            height = 18,
            font_family = font,
            font_size = 15,
            text_color = foreground_color,
            text_color_inactive = foreground_color,
            col = {
                active = primary_color,
                inactive = background_color,
            },
        },
        col = {
            border_active = primary_color,
            border_inactive = background_color,
        }
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
    }
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve('easeOutQuint', { type = 'bezier', points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve('easeInOutCubic', { type = 'bezier', points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve('linear', { type = 'bezier', points = { { 0, 0 }, { 1, 1 } } })
hl.curve('almostLinear', { type = 'bezier', points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve('quick', { type = 'bezier', points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = 'global', enabled = true, speed = 5, bezier = 'default' })
