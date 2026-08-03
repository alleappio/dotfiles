import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls // <--- Add this line!
import qs.Theme

Text {
    text: String.fromCodePoint(0xF0425)
    color: Theme.foreground
    renderType: Theme.textRenderType

    font {
        family: "JetbrainsMono Nerd Font"
        pixelSize: 20
    }

    Process {
        id: powerMenuProc
        command: ["/home/alle/.config/rofi/scripts/powermenu.sh"]
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: mouse => {
            powerMenuProc.running = true
        }
    }
}
