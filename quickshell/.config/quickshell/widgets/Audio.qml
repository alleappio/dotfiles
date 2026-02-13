import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: audioWidget

    required property color textColor
    required property string fontFamily
    required property int fontSize
    property PwNode node: Pipewire.defaultAudioSink
    property real volume: node.audio.volume

    implicitWidth: audioWidgetLabel.implicitWidth
    implicitHeight: audioWidgetLabel.implicitHeight

    PwObjectTracker { 
        objects: [ node ] 
    }

    Text {
        id: audioWidgetLabel

        font { family: audioWidget.fontFamily; pixelSize: audioWidget.fontSize; bold: false }
        renderType: Text.NativeRendering
        color: audioWidget.textColor

        text: {
            const volume = Math.round(audioWidget.node.audio.volume*100)
            var icon = " "
            if(volume < 20){icon = " "}
            if(volume > 70){icon = " "}
            return icon + volume + "%"
        }
    }

    MouseArea {
        anchors.fill: parent
        
        onWheel: (wheel) => {
            var delta = wheel.angleDelta.y > 0 ? 0.01 : -0.01
            var newVolume = Math.max(0, Math.min(1, audioWidget.node.audio.volume + delta))
            audioWidget.setVolume(newVolume)
        }

        onClicked: () => {
            Quickshell.execDetached(["bash", "-c", "pavucontrol"])
        }
    }

    function setVolume(value){
        audioWidget.node.audio.volume = value
    }
}


// "default": ["", "", ""]
