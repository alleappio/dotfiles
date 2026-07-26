import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    id: root
    spacing: 6

    property var cpuUsage
    property var lastCpuTotal
    property var lastCpuIdle

    readonly property string icon: {
        return String.fromCodePoint(0xF035B);
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
        text: cpuUsage + "%"

        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
        }
    }

    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var p = data.trim().split(/\s+/);
                var idle = parseInt(p[4]) + parseInt(p[5]);
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0);
                if (lastCpuTotal > 0) {
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)));
                }
                lastCpuTotal = total;
                lastCpuIdle = idle;
            }
        }
        Component.onCompleted: running = true
    }
    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true;
        }
    }
}
