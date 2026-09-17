pragma Singleton
import QtQuick

QtObject {
    readonly property color background: '#181818'
    readonly property color foreground: '#e4e4e4'
    readonly property color black: '#282828'
    readonly property color red: '#f43841'
    readonly property color green: '#73d936'
    readonly property color yellow: '#ffdd33'
    readonly property color blue: '#96a6c8'
    readonly property color magenta: '#9e95c7'
    readonly property color cyan: '#95a99f'
    readonly property color orange: '#cc8c3c'
    readonly property color white: '#e4e4e4'
    readonly property color primary: yellow

    readonly property int textRenderType: Text.NativeRendering
    readonly property string fontFamily: 'Iosevka Nerd Font'

    readonly property string wallpaperPath: "/home/alle/dotfiles/wallpaper/gruber/background_gruber.jpg"
}
