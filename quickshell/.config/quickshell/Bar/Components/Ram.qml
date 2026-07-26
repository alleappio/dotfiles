import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    id: root
    spacing: 6

    property var memUsage
    readonly property string icon: {
        return String.fromCodePoint(0xEFC5);
    }

    Text {
        text: root.icon
        color: Theme.foreground

        renderType: Theme.textRenderType

        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
        }
    }

    Text {
        text: memUsage + "%"

        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
        }
    }

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var parts = data.trim().split(/\s+/);
                var total = parseInt(parts[1]) || 1;
                var used = parseInt(parts[2]) || 0;
                memUsage = Math.round(100 * used / total);
            }
        }
        Component.onCompleted: running = true
    }
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            memProc.running = true;
        }
    }
}
