import qs.Services
import QtQuick
import qs.Theme

Rectangle {
    visible: VpnService.isUp

    color: Theme.background

    implicitWidth: 24
    implicitHeight: 24

    Text {
        id: icon

        anchors.centerIn: parent

        text: String.fromCodePoint(0xF383)
        color: Theme.foreground

        renderType: Theme.textRenderType

        font {
            family: Theme.fontFamily
            pixelSize: 15
        }
    }
}
