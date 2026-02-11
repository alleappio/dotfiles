import QtQuick
import Quickshell.Wayland
import Quickshell.Widgets

Row {
    id: systemTray
    spacing: 6
    
    Repeater {
        model: SystemTray.items
        
        delegate: Item {
            required property var modelData
            width: 22
            height: 22
            
            IconImage {
                anchors.centerIn: parent
                source: modelData.icon
                width: 18
                height: 18
            }
            
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                
                onClicked: mouse => {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate();
                    } else if (mouse.button === Qt.RightButton) {
                        modelData.contextMenu();
                    }
                }
            }
        }
    }
}
