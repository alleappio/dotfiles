import QtQuick
import QtQuick.Controls
import Quickshell
import "../theme"

PanelWindow {
    id: launcher

    visible: false

    Theme {
        id: theme
    }

    //anchors {
    //    top: true
    //    bottom: true
    //    left: true
    //    right: true
    //}

    //exclusiveZone: -1   // VERY important → makes it float
    focusable: true

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

        Text {
            text: ">"
            color: theme.colPurple
            font { family: theme.fontFamily; pixelSize: 20; bold: true }
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 25
        }
        TextField {
            font { family: theme.fontFamily; pixelSize: 20; bold: false }
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
    }
}
