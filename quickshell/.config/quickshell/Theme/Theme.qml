pragma Singleton
import QtQuick

QtObject {
    readonly property color background: '#1d2021'
    readonly property color background_alt: '#3c3836'
    readonly property color foreground: '#d4be98'
    readonly property color black: '#3c3836'
    readonly property color red: '#ea6962'
    readonly property color green: '#a9b665'
    readonly property color yellow: '#d8a657'
    readonly property color blue: '#7daea3'
    readonly property color magenta: '#d3869b'
    readonly property color cyan: '#89b482'
    readonly property color orange: '#e78a43'
    readonly property color white: '#d4be98'
    readonly property color gray: '#a89984'
    readonly property color primary: gray

    readonly property int textRenderType: Text.NativeRendering
    readonly property string fontFamily: 'Iosevka Nerd Font'

    readonly property string wallpaperPath: "/home/alle/dotfiles/wallpaper/gruvbox-material/background_gruvbox-material.jpeg"
}
