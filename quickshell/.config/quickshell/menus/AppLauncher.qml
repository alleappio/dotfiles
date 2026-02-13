import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland
import qs.theme

FloatingWindow {
    id: launcher

    visible: false

    Theme {
        id: theme
    }

    title: "appMenu"

    function toggle() {
        visible = !visible

        if (visible) {
            Qt.callLater(() => {
                searchField.forceActiveFocus()
            })
        }
    }

    implicitWidth: 500
    implicitHeight: 600
    color:"transparent"

    Rectangle {
        anchors.fill: parent
        radius: 5
        color: theme.colBg
        border.color: theme.colPurple
        border.width: 1
        focus: true

        Text {
            text: ">"
            color: theme.colPurple
            font { family: theme.fontFamily; pixelSize: 20; bold: true }
            renderType: Text.NativeRendering
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 25
        }
        TextField {
            font { family: theme.fontFamily; pixelSize: 20; bold: false }
            renderType: Text.NativeRendering
            id: searchField
            width: parent.width * 0.8

            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            focus: true   // auto-focus when launcher opens
            color: theme.colFg
            palette.text: theme.colFg
            palette.placeholderText: theme.colFg
            background: Rectangle {
                radius: 5
                anchors.fill: parent
                color: theme.colBg
                border.width: 2
                border.color: theme.colBg
            }
        }

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                launcher.toggle();
                event.accepted = true;
            }
        }
    }
}
