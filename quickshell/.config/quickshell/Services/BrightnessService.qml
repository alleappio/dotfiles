pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

QtObject {
    id: root

    // Shared state property
    property int brightness: 50

    // Set brightness via command line and update state immediately
    function setBrightness(percent) {
        let clamped = Math.min(Math.max(percent, 1), 100);
        root.brightness = Math.round(clamped);
        setProcess.exec(["brightnessctl", "set", `${root.brightness}%`]);
    }

    // Process to fetch initial brightness on application startup
    property Process getProcess: Process {
        command: ["brightnessctl", "-m", "i"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                const parts = data.split(",");
                if (parts.length >= 4) {
                    const percent = parseInt(parts[3].replace("%", ""));
                    if (!isNaN(percent))
                        root.brightness = percent;
                }
            }
        }
    }

    // Process executor for setting value
    property Process setProcess: Process {}
    Component.onCompleted: {
        getProcess.running=true;
    }
}
