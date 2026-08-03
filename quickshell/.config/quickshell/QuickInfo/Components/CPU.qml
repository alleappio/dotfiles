import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Services

Text {
    readonly property string icon: {
        return String.fromCodePoint(0xF035B);
    }

    text: icon + " " + StatsService.cpuUsage + "%"

    color: Theme.foreground

    renderType: Theme.textRenderType

    font {
        family: Theme.fontFamily
        pixelSize: 15
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        Process {
            id: htopTuiProc
            command: ["sh", "-c", "alacritty --class htoptui -e htop"]
        }
        onClicked: click => {
            htopTuiProc.running = true;
        }
    }
}

