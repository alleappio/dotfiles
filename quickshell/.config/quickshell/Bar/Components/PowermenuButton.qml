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

    // This makes the Text element clickable
    TapHandler {
        onTapped: {
            console.log("Text was clicked!");
            // Put your action here (e.g., executing a hyprland dispatch command)
        }
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
