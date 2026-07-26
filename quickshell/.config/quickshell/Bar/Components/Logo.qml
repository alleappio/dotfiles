import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls // <--- Add this line!
import qs.Theme

Text {
    text: String.fromCodePoint(0xF08C7)
    color: Theme.foreground
    renderType: Theme.textRenderType

    font {
        family: "JetbrainsMono Nerd Font"
        pixelSize: 15
    }

    TapHandler {
        onTapped: {
            console.log("Text was clicked!")
        }
    }

    Process {
        id: launcherProc
        command: ["/home/alle/.config/rofi/scripts/main_menu.sh"]
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: mouse => {
            launcherProc.running = true
        }
    }
}
