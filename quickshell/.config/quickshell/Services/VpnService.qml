pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property string state: "Stopped"
    property bool isUp: state === "Running"

    // Buffer to accumulate entire JSON output
    property string _stdoutBuffer: ""

    Process {
        id: tailscaleProc
        command: ["tailscale", "status", "--json"]
        running: false

        stdout: SplitParser {
            onRead: data => {
                // Collect line fragments as they come in
                root._stdoutBuffer += data + "\n";
            }
        }

        onExited: (code, status) => {
            if (code === 0 && root._stdoutBuffer.trim().length > 0) {
                try {
                    let json = JSON.parse(root._stdoutBuffer);
                    root.state = json.BackendState || "Unknown";
                } catch (e) {
                    console.warn("Failed to parse Tailscale JSON output:", e);
                    root.state = "Error";
                }
            } else {
                root.state = "Stopped";
            }

            // Reset buffer for the next timer check
            root._stdoutBuffer = "";
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            if (!tailscaleProc.running) {
                root._stdoutBuffer = "";
                tailscaleProc.running = true;
            }
        }
    }
}
