import QtQuick
import Quickshell.Hyprland
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import qs.theme
import qs.menus

Rectangle{
    required property string icon 
    required property color colButton 
    required property color colIcon 
    required property color colBg 
    required property string fontFamily 
    required property int iconSize 
    required property var clickAction

    radius: 5
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: mouse.hovered? colButton : colBg

    Text {
        anchors.centerIn: parent
        text: icon
        font { family: fontFamily; pixelSize: iconSize; bold: true }
        renderType: Text.NativeRendering
        color: theme.colFg
    }

    MouseArea {
        anchors.fill:parent
        onClicked: clickAction()
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }
}
