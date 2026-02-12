import Quickshell
import QtQuick
import qs.menus


Item {
    id: poweroffWidget
    required property color logoColor
    required property string fontFamily
    required property int fontSize
    implicitWidth: poweroffWidgetLabel.implicitWidth
    implicitHeight: poweroffWidgetLabel.implicitHeight

    PoweroffMenu {
        id: poweroffMenu
    }

    Text {
        anchors.fill: parent
        id: poweroffWidgetLabel
        text: "⏻ "
        color: poweroffWidget.logoColor
        font { family: poweroffWidget.fontFamily; pixelSize: poweroffWidget.fontSize }
        renderType: Text.NativeRendering
        MouseArea {
            anchors.fill: parent
            onClicked: poweroffMenu.toggle()
        }
    }
}
