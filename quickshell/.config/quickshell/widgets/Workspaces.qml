import Quickshell
import Quickshell.Hyprland
import QtQuick

Repeater {
    required property color activeColor
    required property color inactiveColor
    required property color focusColor
    required property string fontFamily
    required property int fontSize

    model: 9

    Text {
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        text: index + 1
        color: isActive ? focusColor : (ws ? activeColor : inactiveColor)
        font { family: fontFamily; pixelSize: fontSize; bold: false }
        renderType: Text.NativeRendering
        MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + (index + 1))
        }
    }
}
