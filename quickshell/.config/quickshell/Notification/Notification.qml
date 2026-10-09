import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Services
import "config.js" as Config

PopupWindow {
    id: root
    required property var parentWindow

    // === REQUIRED FOR VISIBILITY ===
    anchor.window: parentWindow   // This is the most important line
    // You can also do: anchor { window: parentWindow }

    visible: NotificationService.notifications.length > 0
    screen: parentWindow ? parentWindow.screen : Quickshell.screens[0]
    color: Theme.background
    implicitWidth: 380
    implicitHeight: Math.max(1, notificationList.contentHeight)

    // Position it (example: centered below your bar)
    anchor.rect.x: parentWindow.width - implicitWidth
    anchor.rect.y: parentWindow.height  // small gap

    ListView {
        id: notificationList
        width: parent.width
        height: contentHeight
        interactive: false
        model: NotificationService.notifications
        delegate: Rectangle {
            id: card
            required property var modelData

            Timer {
                id: timeoutTimer
                running: card.modelData.urgency !== NotificationUrgency.Critical
                interval: Config.notifications.timeout
                repeat: false
                onTriggered: {
                    if (card.modelData && card.modelData.tracked) {
                        card.modelData.tracked = false;
                    }
                }
            }

            Connections {
                target: card.modelData
                function onClosed() {
                    timeoutTimer.stop();
                }
            }

            width: notificationList.width
            height: Math.max(36, summary.implicitHeight + (body.visible ? body.implicitHeight + 2 : 0)) + 20
            radius: 0
            color: Theme.background
            border.width: 0

            readonly property color cardBorderColor: modelData.urgency === NotificationUrgency.Critical ? Theme.red : Theme.primary

            Rectangle {
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 1
                color: card.cardBorderColor
            }

            Rectangle {
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: 1
                color: card.cardBorderColor
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                height: 1
                color: card.cardBorderColor
            }

            Item {
                anchors {
                    fill: parent
                    margins: 10
                }

                Image {
                    id: icon
                    anchors.left: parent.left
                    anchors.top: parent.top
                    width: 36
                    height: 36
                    fillMode: Image.PreserveAspectFit
                    visible: source.toString() != ""
                    source: card.modelData.image || card.modelData.appIcon || ""
                }

                Column {
                    anchors.left: icon.visible ? icon.right : parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    spacing: 2

                    Text {
                        id: summary
                        width: parent.width
                        text: card.modelData.summary
                        color: Theme.primary
                        font.family: Theme.fontFamily
                        font.pixelSize: Config.bar.fontSize
                        font.bold: true
                        elide: Text.ElideRight
                    }

                    Text {
                        id: body
                        width: parent.width
                        visible: text !== ""
                        text: card.modelData.body
                        color: Theme.foreground
                        font.family: Theme.fontFamily
                        font.pixelSize: Config.bar.fontSize - 1
                        wrapMode: Text.WordWrap
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: click => {
                    if (click.button == Qt.LeftButton) {
                        if (card.modelData.actions && card.modelData.actions.length > 0) {
                            card.modelData.actions[0].invoke();
                        }
                    } else if (click.button == Qt.RightButton) {
                        if (card.modelData && card.modelData.tracked) {
                            card.modelData.tracked = false;
                        }
                    }
                }
            }
        }
    }
}
