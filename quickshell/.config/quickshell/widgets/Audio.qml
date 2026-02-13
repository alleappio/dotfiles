import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: audioWidget

    required property color textColor
    required property string fontFamily
    required property int fontSize
    property PwNode node: Pipewire.defaultAudioSink

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
            const volume = Math.round(node.audio.volume*100)
            var icon = " "
            if(volume < 20){
                icon = " "
            }
            if(volume > 70){
                icon = " "
            }
            return icon + volume + "%"
        }
    }
}


// "default": ["", "", ""]
