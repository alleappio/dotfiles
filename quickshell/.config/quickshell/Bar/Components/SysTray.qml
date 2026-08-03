import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    // Feeds back its exact size to your status bar layout
    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 8

        Repeater {
            // SystemTray.items is a reactive ObjectModel containing active tray clients
            model: SystemTray.items

            delegate: Item {
                id: trayItemWrapper

                // Every item injected into the repeater gets 'modelData' context automatically
                // representing a SystemTrayItem object
                implicitWidth: 22
                implicitHeight: 22

                // 1. The Tray Icon
                Image {
                    anchors.fill: parent
                    source: modelData.icon // The service provides an image-compatible source string
                    fillMode: Image.PreserveAspectFit

                    // Smooth scaling for system tray visuals
                    mipmap: true
                }

                // 2. Mouse/Click Handler for the Tray App
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked: mouse => {
                        if (mouse.button === Qt.LeftButton) {
                            // Primary action (e.g., opens up Discord or Steam window)
                            modelData.activate();
                        } else if (mouse.button === Qt.RightButton) {
                            // Secondary action: Opens the app's standard context menu natively
                            // We pass 0, 0 as offsets because it automatically pops up at cursor location
                            modelData.display(Quickshell.parentWindow, 0, 0);
                        }
                    }
                }
            }
        }
    }
}
