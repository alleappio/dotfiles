pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool capsLock: false

    Process {
        id: capsProcess

        command: [
            "sh", "-c",
            "found=0; " +
            "for f in /sys/class/leds/*capslock*/brightness; do " +
            "    [ -f \"$f\" ] || continue; " +
            "    [ \"$(cat \"$f\")\" = \"1\" ] && found=1; " +
            "done; " +
            "echo $found"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                root.capsLock = this.text.trim() === "1"
            }
        }
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: capsProcess.running = true
    }
}
