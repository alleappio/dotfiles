-- Super key
mainMod = 'SUPER' -- Sets "Windows" key as main modifier

-- terminal = 'alacritty -e ~/.config/tmux/sessions/home.sh'
terminal = 'foot tmux'
fileManager = 'nautilus'
menu = "~/.config/rofi/scripts/launcher.sh"
poweroffMenu = "~/.config/rofi/scripts/powermenu.sh"

reload_fn = function()
    hl.dispatch(hl.dsp.exec_cmd('pkill qs'))
    hl.dispatch(hl.dsp.exec_cmd('qs &'))
end

-- environment vars.
hl.env('XCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_SIZE', '24')
hl.env('XCURSOR_SIZE', '24')
-- hl.env('QT_QPA_PLATFORMTHEME', 'kde')
-- hl.env('XDG_MENU_PREFIX', 'arch-')
hl.env('TERMINAL', 'foot')
