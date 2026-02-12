import Quickshell
import QtQuick
import Quickshell.Services.UPower

Text {
    id: powerProfileWidget

    required property color textColor
    required property string fontFamily
    required property int fontSize

    font { family: fontFamily; pixelSize: fontSize; bold: false }
    renderType: Text.NativeRendering
    
    color: textColor

    text: switch(PowerProfiles.profile){
        case PowerProfile.Performance:
            return ""
        case PowerProfile.Balanced:
            return ""
        case PowerProfile.PowerSaver:
            return ""
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            switch(PowerProfiles.profile){
                case PowerProfile.Performance:
                    PowerProfiles.profile=PowerProfiles.PowerSaver
                    return 
                case PowerProfile.Balanced:
                    PowerProfiles.profile=PowerProfiles.Performance
                    return 
                case PowerProfile.PowerSaver:
                    PowerProfiles.profile=PowerProfiles.Balanced
                    return 
            }
        }
    }
}
