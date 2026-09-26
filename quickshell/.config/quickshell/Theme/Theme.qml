pragma Singleton
import QtQuick

QtObject {
    readonly property color background: '#141415'
    readonly property color foreground: '#cdcdcd'
    readonly property color black: '#252530'
    readonly property color red: '#d8647e'
    readonly property color green: '#7fa563'
    readonly property color yellow: '#f3be7c'
    readonly property color blue: '#6e94b2'
    readonly property color magenta: '#bb9dbd'
    readonly property color cyan: '#aeaed1'
    readonly property color orange: '#f3be7c'
    readonly property color white: '#cdcdcd'
    readonly property color primary: cyan

    readonly property int textRenderType: Text.NativeRendering
    readonly property string fontFamily: 'Iosevka Nerd Font'

    readonly property string wallpaperPath: "/home/alle/dotfiles/wallpaper/vague/background_vague.png"
}
