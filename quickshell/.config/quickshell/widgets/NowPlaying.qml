import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: npWidget

    required property color textColor
    required property string fontFamily
    required property int fontSize
    required property int maxWidth

    implicitWidth: npWidgetLabel.implicitWidth
    implicitHeight: npWidgetLabel.implicitHeight

    Text {
        id: npWidgetLabel

        font { family: npWidget.fontFamily; pixelSize: npWidget.fontSize; bold: false }
        renderType: Text.NativeRendering
        color: npWidget.textColor

        text: ""
    }

    MouseArea {
        anchors.fill: parent
        
        onClicked: () => {
            console.log("ciaoo")
        }
    }

    Process {
        id: getNowPlaying
        running: true
        command: ["bash", "-c", Quickshell.shellDir+"/scripts/playing.bash"]
        stdout: SplitParser {
            onRead: data => {
                if (!data){
                    npWidgetLabel.text = ""
                    return
                }
                var splitted = data.split(":")
                var icon = ""

                if(splitted[0].includes("Playing")){
                    icon = ""
                }

                if(splitted[0].includes("Paused")){
                    icon = ""
                }

                var toDisplay = splitted[1].slice(0,npWidget.maxWidth).trim()
                if(splitted[1].trim().length>toDisplay.length){
                    toDisplay = toDisplay+"..."
                }
                npWidgetLabel.text = icon+"  "+toDisplay
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            getNowPlaying.running = false
            getNowPlaying.running = true
        }
    }
}


// "default": ["", "", ""]
