import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Theme

RowLayout {
    id: root
    Layout.fillWidth: true
    spacing: 10

    property int phase: 0 // 0 = work, 1 = rest, 2 = long rest
    readonly property string phase_string: {
        switch (phase) {
            case 0: return "Work";
            case 1: return "Rest";
            case 2: return "Long rest";
            default: return "Work";
        }
    }
    readonly property int workTime: 20 * 60       // 25 minutes
    readonly property int shortBreak: 5 * 60      // 5 minutes
    readonly property int longBreak: 15 * 60      // 15 minutes
    property int timeRemaining: workTime
    property bool running: false // 0 = work, 1 = rest, 2 = long rest
    property int sessionCount: 0
    readonly property string formattedTime: {
        let minutes = Math.floor(timeRemaining / 60)
        let seconds = timeRemaining % 60
        return `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
    }

    Text {
        text: String.fromCodePoint(0xE003);

        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: Theme.fontFamily
            pixelSize: 15
            weight: 500
        }
    }

    Text {
        text: phase_string

        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: Theme.fontFamily
            pixelSize: 15
            weight: 500
        }
    }
    Item {
        Layout.fillWidth: true
    }
    Text {
        text: formattedTime

        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: Theme.fontFamily
            pixelSize: 15
            weight: 500
        }
    }
    Item {
        Layout.fillWidth: true
    }

    Button {
        id: resetButton
        text: String.fromCodePoint(0xF0465)
        implicitWidth: 25
        implicitHeight: 25
        background: Rectangle {
            color: Theme.background
            border.color: Theme.primary // Border color
            border.width: 1             // Border thickness
            radius: 0                  // Optional: rounded corners (use 0 for sharp corners)
        }
        contentItem: Text {
            text: parent.text
            color: Theme.foreground // Set your desired foreground color here
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: 15
            }
        }
        onClicked: {
            root.phase = 0
            root.timeRemaining = workTime
            root.sessionCount = 0
            root.running = false
        }
    }
    Button {
        id: startButton
        text: {
            if(root.running)
                return String.fromCodePoint(0xF03E4);
            return String.fromCodePoint(0xF040A);
        }
        implicitWidth: 25
        implicitHeight: 25
        background: Rectangle {
            color: Theme.background
            border.color: Theme.primary // Border color
            border.width: 1             // Border thickness
            radius: 0                  // Optional: rounded corners (use 0 for sharp corners)
        }
        contentItem: Text {
            text: parent.text
            color: Theme.foreground // Set your desired foreground color here
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: 15
            }
        }
        onClicked: {
            root.toggleTimer()
        }
    }

    Button {
        id: skipButton
        text: String.fromCodePoint(0xF013E)
        implicitWidth: 25
        implicitHeight: 25
        background: Rectangle {
            color: Theme.background
            border.color: Theme.primary // Border color
            border.width: 1             // Border thickness
            radius: 0                  // Optional: rounded corners (use 0 for sharp corners)
        }
        contentItem: Text {
            text: parent.text
            color: Theme.foreground // Set your desired foreground color here
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: 15
            }
        }
        onClicked: {
            root.handlePhaseComplete()
        }
    }

    Timer {
        id: pomodoroTimer
        interval: 1000
        repeat: true
        running: root.running

        onTriggered: {
            if (root.timeRemaining > 0) {
                root.timeRemaining -= 1
            } else {
                root.handlePhaseComplete()
            }
        }
    }
    function toggleTimer() {
        root.running = !root.running
    }

    function resetTimer() {
        root.running = false
        if (root.phase === 0) root.timeRemaining = workTime
        else if (root.phase === 1) root.timeRemaining = shortBreak
        else root.timeRemaining = longBreak
    }

    function handlePhaseComplete() {
        root.running = false

        root.sendNotification()

        if (root.phase === 0) {
            root.sessionCount += 1
            if (root.sessionCount % 4 === 0) {
                root.phase = 2
            } else {
                root.phase = 1
            }
        } else {
            root.phase = 0
        }

        root.resetTimer()

        // Trigger desktop notification via Quickshell/Qt
        // e.g., NotificationService.sendNotification("Pomodoro", "Time's up!")
    }

    Process {
        id: notificationProcess
        running: false
    }
    function sendNotification() {
        notificationProcess.command = [
            "notify-send",
            "-a", "Pomodoro",      // App Name
            "Pomodoro",
            "Phase " + root.phase_string + " ended"
        ]
        notificationProcess.running = true
    }
}
