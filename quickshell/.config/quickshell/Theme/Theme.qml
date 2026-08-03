pragma Singleton
import QtQuick

QtObject {
    readonly property color background: '#1d2021'
    readonly property color foreground: '#ebdbb2'
    readonly property color black: '#282828'
    readonly property color red: '#cc241d'
    readonly property color green: '#98971a'
    readonly property color yellow: '#d79921'
    readonly property color blue: '#458588'
    readonly property color magenta: '#b16286'
    readonly property color cyan: '#689d6a'
    readonly property color orange: '#d65d0e'
    readonly property color white: '#ebdbb2'
    readonly property color primary: orange

    readonly property int textRenderType: Text.NativeRendering
    readonly property string fontFamily: "JetbrainsMono Nerd Font"
}
