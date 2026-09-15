hl.monitor({
    output = '',
    mode = '1920x1080',
    position = 'auto',
    scale = 1,
})

hl.monitor({
    output = 'eDP-1',
    mode = '1920x1080',
    position = '0x0',
    scale = 1,
})

hl.monitor({
    output = 'HDMI-A-2',
    mode = '1920x1080',
    position = '0x0',
    scale = 1,
    mirror = 'eDP-1',
})

hl.monitor({
    output = 'DP-1',
    mode = '1920x1080',
    position = '1920x0',
    scale = 1,
})

for i = 1, 7 do
    hl.workspace_rule({ workspace = i, monitor = 'eDP-1' })
end

for i = 8, 10 do
    hl.workspace_rule({ workspace = i, monitor = 'DP-1' })
end
