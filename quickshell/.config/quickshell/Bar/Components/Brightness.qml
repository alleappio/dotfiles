import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme // To pull in Theme variables

Item {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    // Internal state to hold current brightness integer percentage
    property int brightnessValue: 0
    property int brightnessMax: 0
    property int brightnessPercentage: 0
    property string icon: {
        let sum = Math.floor((14*brightnessPercentage)/100);
        console.log(sum)
        return String.fromCodePoint(0xe3d5 + sum);
    }

    // 1. Reader Process - Grabs current brightness percentage
    Process {
        id: brightnessReader
        // Machine readable format (-m) returns comma-separated values.
        // We grab the 4th field (the percentage) and strip the '%' character.
        command: ["sh", "-c", "brightnessctl -m | cut -d, -f4 | tr -d '%'"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                let percentage = parseInt(this.text.trim());
                if (!isNaN(percentage)) {
                    root.brightnessPercentage = percentage;
                    // console.log("brightness updated: " + percentage + "%");
                }
            }
        }
    }

    // 3. Modifier Process - Overwrites value on scroll actions
    Process {
        id: brightnessWriter
        running: false
        onRunningChanged: {
            // Once the update completes, pull fresh numbers
            if (!running)
                brightnessReader.running = true;
        }
    }

    function adjustBrightness(amount) {
        brightnessWriter.command = ["brightnessctl", "set", amount];
        brightnessWriter.running = true;
    }

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 6

        // Sun / Brightness Icon
        Text {
            text: icon // Nerd Font Sun icon
            color: Theme.foreground
            renderType: Theme.textRenderType
            font {
                family: "JetbrainsMono Nerd Font"
                pixelSize: 15
                weight: 500
            }
        }

        // Percentage Output text
        Text {
            text: root.brightnessPercentage + "%"
            color: Theme.foreground
            renderType: Theme.textRenderType
            font {
                family: "JetbrainsMono Nerd Font"
                pixelSize: 15
                weight: 500
            }
        }
    }

    // 5. Interaction layer to intercept scrolling over the widget
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onWheel: wheel => {
            if (wheel.angleDelta.y > 0) {
                root.adjustBrightness("+5%"); // Scroll Up: +5% Brightness
            } else if (wheel.angleDelta.y < 0) {
                root.adjustBrightness("5%-"); // Scroll Down: -5% Brightness
            }
        }
    }
}
