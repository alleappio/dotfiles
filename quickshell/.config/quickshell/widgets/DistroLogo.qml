import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick

Text {
    required property color logoColor
    required property int fontSize
    text: " 󰣇"
    color: logoColor
    font { pixelSize: fontSize }
    renderType: Text.NativeRendering
    MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("exec fuzzel")
    }
}
