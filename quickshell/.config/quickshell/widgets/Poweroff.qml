import Quickshell
import QtQuick

Text {
    required property color logoColor
    required property string fontFamily
    required property int fontSize
    text: "⏻ "
    color: logoColor
    font { family: fontFamily; pixelSize: fontSize }
    renderType: Text.NativeRendering
    MouseArea {
        anchors.fill: parent
        onClicked: console.log("to be developed")
    }
}
