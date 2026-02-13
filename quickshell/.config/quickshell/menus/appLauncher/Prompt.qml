import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.theme
import qs.menus.appLauncher

Rectangle {
    color: "transparent"
    width: parent.width
    height: searchField.implicitHeight*2 
    required property color textColor
    required property color bgColor
    required property color primaryColor
    required property string fontFamily
    required property int fontSize
    id: prompt
    focus:true
    Text {
        text: ">"
        color: prompt.primaryColor
        font { family: prompt.fontFamily; pixelSize: prompt.fontSize; bold: true }
        renderType: Text.NativeRendering
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 25
    }
    TextField {
        font { family: prompt.fontFamily; pixelSize: prompt.fontSize; bold: false }
        renderType: Text.NativeRendering
        id: searchField
        width: parent.width * 0.8

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        focus: true   // auto-focus when launcher opens
        color: prompt.textColor
        palette.text: prompt.textColor
        palette.placeholderText: prompt.textColor
        background: Rectangle {
            radius: 5
            anchors.fill: parent
            
            color: prompt.bgColor
            border.width: 2
            border.color: prompt.primaryColor
        }
    }

    property alias textField: searchField
}
