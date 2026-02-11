import Quickshell
import Quickshell.Io
import QtQuick

Text {
    required property color logoColor
    required property int fontSize
    text: " 󰣇"
    color: logoColor
    font { pixelSize: fontSize }
    MouseArea {
        anchors.fill: parent
        onClicked: ["bash", "fuzzel"]
    }
}
