import qs.Services
import QtQuick
import qs.Theme

Rectangle {
    visible: CapsLockService.capsLock

    color: Theme.primary

    implicitWidth: 24
    implicitHeight: 24

    Text {
        id: icon

        anchors.centerIn: parent

        text: String.fromCodePoint(0xE672)
        color: Theme.background

        renderType: Theme.textRenderType

        font {
            family: Theme.fontFamily
            pixelSize: 15
        }
    }
}
