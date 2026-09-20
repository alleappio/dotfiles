pragma Singleton
import QtQuick

QtObject {
    readonly property color background: '#191724'
    readonly property color foreground: '#e0def4'
    readonly property color black: '#26233a'
    readonly property color red: '#eb6f92'
    readonly property color green: '#31748f'
    readonly property color yellow: '#f6c177'
    readonly property color blue: '#9ccfd8'
    readonly property color magenta: '#c4a7e7'
    readonly property color cyan: '#ebbcba'
    readonly property color orange: '#ebbcba'
    readonly property color white: '#e0def4'
    readonly property color primary: magenta

    readonly property int textRenderType: Text.NativeRendering
    readonly property string fontFamily: 'Iosevka Nerd Font'

    readonly property string wallpaperPath: "/home/alle/dotfiles/wallpaper/rosepine/background_rosepine.jpg"
}
