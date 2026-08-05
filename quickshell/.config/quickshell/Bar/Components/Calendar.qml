import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Theme

PopupWindow {
    id: root
    required property var parentWindow

    // === REQUIRED FOR VISIBILITY ===
    anchor.window: parentWindow   // This is the most important line
    // You can also do: anchor { window: parentWindow }

    visible: false
    screen: parentWindow ? parentWindow.screen : Quickshell.screens[0]
    color: Theme.background
    implicitWidth: 300
    implicitHeight: 300

    // Position it (example: centered below your bar)
    anchor.rect.x: (parentWindow.width - width) / 2
    anchor.rect.y: parentWindow.height  // small gap

    // This runs immediately when the popup loses focus/input grab
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            root.visible = false;
        }
    }
    Rectangle {
        anchors.fill: parent
        anchors.topMargin: -1
        color: Theme.background
        border.color: Theme.primary
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 12

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: new Date().toLocaleDateString(Qt.locale(), "MMMM yyyy")
                color: Theme.primary
                renderType: Theme.textRenderType
                font {
                    family: Theme.fontFamily
                    pixelSize: 18
                    weight: Font.Bold
                }
            }

            DayOfWeekRow {
                Layout.fillWidth: true
                locale: grid.locale
                delegate: Text {
                    text: model.shortName
                    color: Theme.foreground
                    horizontalAlignment: Text.AlignHCenter
                    font.family: Theme.fontFamily
                    font.pixelSize: 13
                }
            }

            MonthGrid {
                id: grid
                Layout.fillWidth: true
                Layout.fillHeight: true
                month: new Date().getMonth()
                year: new Date().getFullYear()
                locale: Qt.locale("en_US")

                delegate: Text {
                    required property var model
                    text: model.day
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: model.month === grid.month ? 1.0 : 0.3
                    color: {
                        let today = new Date();
                        if (model.date.getDate() === today.getDate() && model.date.getMonth() === today.getMonth() && model.date.getFullYear() === today.getFullYear())
                            return Theme.primary;
                        return Theme.foreground;
                    }
                    font {
                        family: Theme.fontFamily
                        pixelSize: 14
                    }
                }
            }
        }
    }
}
