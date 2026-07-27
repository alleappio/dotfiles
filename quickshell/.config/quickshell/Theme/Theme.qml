pragma Singleton
import QtQuick

QtObject {
    readonly property color background: '#14171d'
    readonly property color foreground: '#C5C9C7'
    readonly property color black: '#14171d'
    readonly property color red: '#c4746e'
    readonly property color green: '#8a9a7b'
    readonly property color yellow: '#c4b28a'
    readonly property color blue: '#8ba4b0'
    readonly property color magenta: '#a292a3'
    readonly property color cyan: '#8ea4a2'
    readonly property color orange: '#b6927b'
    readonly property color white: '#C5C9C7'
    readonly property color primary: blue

    readonly property int textRenderType: Text.NativeRendering
    readonly property string fontFamily: "JetbrainsMono Nerd Font"
}
