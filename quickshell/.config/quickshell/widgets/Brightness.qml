import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Item {
    id: brightnessWidget
    required property color textColor
    required property string fontFamily
    required property int fontSize
    property int brightness: 0

    implicitWidth: brightnessWidgetLabel.implicitWidth
    implicitHeight: brightnessWidgetLabel.implicitHeight
    Text {
        id: brightnessWidgetLabel
        property int brightness: 100
        text: brightness
        color: brightnessWidget.textColor
        font { family: brightnessWidget.fontFamily; pixelSize: brightnessWidget.fontSize; bold: false }

        MouseArea {
            anchors.fill: parent
            
            onWheel: (wheel) => {
                var delta = wheel.angleDelta.y > 0 ? 2 : -2
                var newBrightness = Math.max(0, Math.min(100, brightnessWidget.brightness + delta))
                brightnessWidget.setBrightness(newBrightness)
            }
        }
    }

    Process {
        id: getBrightness
        command: ["sh", "-c", "brightnessctl --machine-readable"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/,/)
                var percent = parseInt(parts[3]) 
                brightnessWidget.brightness = percent
                brightnessWidgetLabel.text = " " + percent + "%"
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            getBrightness.running = false
            getBrightness.running = true
        }
    }

    function setBrightness(percent) {
        var setProcess = Qt.createQmlObject('
            import Quickshell.Io
            Process {
                command: ["brightnessctl", "set", "' + percent + '%"]
                running: true
            }
        ', brightnessWidget)
        
        brightnessWidget.brightness = percent
        brightnessWidgetLabel.text = " " + percent + "%"
    }
}
