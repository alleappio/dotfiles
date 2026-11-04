pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    // Raw parsed list of monitors and their tags
    property var monitors: []

    // Helper to get tags for a specific monitor name
    function getTagsForMonitor(monitorName) {
        for (var i = 0; i < monitors.length; i++) {
            if (monitors[i].monitor === monitorName) {
                return monitors[i].tags;
            }
        }
        return [];
    }

    // Helper to get the layout string of the currently active/focused tag for a monitor
    function getLayoutForMonitor(monitorName) {
        var tags = getTagsForMonitor(monitorName);
        for (var i = 0; i < tags.length; i++) {
            if (tags[i].is_active) {
                return tags[i].layout || "";
            }
        }
        return "";
    }

    // Helper command to send tag actions back to mangowm
    function setTag(monitorName, tagIndex) {
        // Adjust command if mangowm uses a different syntax (e.g., mmsg tag <index>)
        tagProcess.command = ["mmsg", "dispatch", "tag", tagIndex.toString()];
        tagProcess.running = true;
    }

    // Process to continuously poll or query mangowm status
    Process {
        id: fetchProcess
        command: ["mmsg", "get", "all-tags"]
        running: true

        stdout: SplitParser {
            onRead: data => {
                try {
                    var parsed = JSON.parse(data);
                    if (parsed && parsed.all_tags) {
                        root.monitors = parsed.all_tags;
                    }
                } catch (e) {
                    // Ignore incomplete line chunks or JSON parse errors
                }
            }
        }
    }

    // Polling timer (adjust interval as needed, or switch to event stream if mangowm supports IPC streaming)
    Timer {
        interval: 100 // ms
        running: true
        repeat: true
        onTriggered: {
            if (!fetchProcess.running) {
                fetchProcess.running = true;
            }
        }
    }

    Process {
        id: tagProcess
        running: false
    }
}
