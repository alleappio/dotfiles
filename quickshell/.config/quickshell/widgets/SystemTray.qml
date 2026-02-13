import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import qs.menus

Item {
    id: systemTray
    required property color bgColor
    required property int iconDimension

    Row {
        id: trayRow
        spacing: 4
        Repeater {
            model: SystemTray.items
            Rectangle {
                width: modelData.status? systemTray.iconDimension : 0 
                height: systemTray.iconDimension 
                color: systemTray.bgColor

                QsMenuOpener {
                    id: menuOpener
                    menu: modelData.menu
                }

                IconImage {
                    id: icon
                    anchors.centerIn:parent
                    height: parent.height * 0.8 
                    width: parent.width  * 0.8
                    source: modelData.icon
                }

                MouseArea {
                    anchors.fill: parent

                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    onClicked: (mouse) => {
                        // LEFT click: activate app
                        if (mouse.button === Qt.LeftButton) {
                            modelData.activate()
                        }

                        // RIGHT click: open menu (if exists)
                        if (mouse.button === Qt.RightButton && modelData.hasMenu) {
                            console.log("to be implemented")
                        }
                    }
                }
            }
        }
    }

    implicitWidth: trayRow.implicitWidth
    implicitHeight: trayRow.implicitHeight
}
