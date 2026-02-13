import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick

Item {
    id: networkWidget
    required property color textColor
    required property string fontFamily
    required property int fontSize

    implicitWidth: networkWidgetLabel.implicitWidth
    implicitHeight: networkWidgetLabel.implicitHeight

    Text {
        //anchors.fill: parent
        id: networkWidgetLabel

        font { family: networkWidget.fontFamily; pixelSize: networkWidget.fontSize; bold: false }
        renderType: Text.NativeRendering

        color: networkWidget.textColor 
        text: "ciao" 

    }

    Process {
        id: getNetworkType 
        command: ["sh", "-c", "nmcli -t -f TYPE,STATE d status && nmcli -t -f CONNECTIVITY g"]
        running: false
        stdout: SplitParser{
            onRead: data => {
               if(!data) return 
               var key_value = data.split(":")
               if(key_value[0] == "ethernet" && !key_value[1].includes("disconnected")){
                   networkWidgetLabel.text = "󰈀"
               }

               if(key_value[0] == "wifi" && !key_value[1].includes("disconnected")){
                   networkWidgetLabel.text = ""
               }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("exec kitty --class nmtui-float -e nmtui")
    }

    Component.onCompleted: {
        getNetworkType.running=false
        getNetworkType.running=true
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            getNetworkType.running=false
            getNetworkType.running=true
        }
    }

}
