import QtQuick
import Quickshell.Hyprland
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
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
    required property string shortcutButton
    property bool selected

    radius: 5
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: selected? colButton : colBg

    Text {
        anchors.centerIn: parent
        text: icon
        font { family: fontFamily; pixelSize: iconSize; bold: true }
        renderType: Text.NativeRendering
        color: theme.colFg
    }

    Text {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: shortcutButton
        font { family: fontFamily; pixelSize: iconSize/2; bold: true }
        renderType: Text.NativeRendering
        color: theme.colFg
    }

    MouseArea {
        anchors.fill:parent
        onClicked: clickAction()
        hoverEnabled: true
        onEntered: {
            selected = true
        }
        onExited: {
            selected = false
        }
    }
}
