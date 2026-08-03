pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

QtObject {
    id: root

    // Shared reactive properties
    property int cpuUsage: 0
    property int ramUsage: 0

    // Process to read RAM usage from /proc/meminfo
    property Process getRamProcess: Process {
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data)
                    return;
                var parts = data.trim().split(/\s+/);
                var total = parseInt(parts[1]) || 1;
                var used = parseInt(parts[2]) || 0;
                root.ramUsage = Math.round(100 * used / total);
            }
        }
    }

    // Process to read CPU usage over a 1-second sample
    property Process getCpuProcess: Process {
        command: ["sh", "-c", "top -bn2 -d 0.5 | grep '%Cpu' | tail -n1 | awk '{print int(100 - $8)}'"]
        stdout: SplitParser {
            onRead: (data) => {
                let val = parseInt(data.trim());
                if (!isNaN(val)) root.cpuUsage = val;
            }
        }
    }

    // Timer to update values periodically (e.g., every 2 seconds)
    property Timer updateTimer: Timer {
        interval: 4000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            root.getRamProcess.running = true;
            root.getCpuProcess.running = true;
        }
    }

    Component.onCompleted: {
        updateTimer.start();
    }
}
