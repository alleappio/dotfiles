-- Super key
mainMod = 'SUPER' -- Sets "Windows" key as main modifier

terminal = 'alacritty -e tmux'
fileManager = 'dolphin'
menu = '~/.config/rofi/scripts/launcher.sh'
poweroffMenu = '~/.config/rofi/scripts/powermenu.sh'

reload_fn = function()
    hl.dispatch(hl.dsp.exec_cmd('pkill waybar'))
    hl.dispatch(hl.dsp.exec_cmd('pkill hyprpaper'))
    hl.dispatch(hl.dsp.exec_cmd('waybar &'))
    hl.dispatch(hl.dsp.exec_cmd('hyprpaper &'))
    hl.dispatch(hl.dsp.exec_cmd('swaync-client -R &'))
    hl.dispatch(hl.dsp.exec_cmd('swaync-client -rs &'))
end

-- environment vars.
hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_SIZE', '24')
hl.env('XCURSOR_SIZE', '24')
hl.env('QT_QPA_PLATFORMTHEME', 'kde')
hl.env('XDG_MENU_PREFIX', 'arch-')
