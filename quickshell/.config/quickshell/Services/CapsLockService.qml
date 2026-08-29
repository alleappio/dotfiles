pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property bool capsLock: false

    FileView {
        id: capsFile
        path: "/sys/class/leds/input3::capslock/brightness"
        onLoaded: {
            root.capsLock = text().trim() === "1"
        }
        onLoadFailed: (error) => {
            console.log("load failed:", error)
        }
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: capsFile.reload()
    }
}
