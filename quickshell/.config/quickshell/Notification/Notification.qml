import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.Theme
import "config.js" as Config

PopupWindow {
    id: root
    required property var parentWindow

    // === REQUIRED FOR VISIBILITY ===
    anchor.window: parentWindow   // This is the most important line
    // You can also do: anchor { window: parentWindow }

    visible: server.trackedNotifications.values.length > 0
    screen: parentWindow ? parentWindow.screen : Quickshell.screens[0]
    color: Theme.background
    implicitWidth: 380
    implicitHeight: Math.max(1, column.implicitHeight)

    // Position it (example: centered below your bar)
    anchor.rect.x: parentWindow.width - implicitWidth
    anchor.rect.y: parentWindow.height  // small gap

    NotificationServer {
        id: server
        actionsSupported: true
        bodySupported: true
        imageSupported: true
        onNotification: n => {
            n.tracked = true;
        }
    }
    ColumnLayout {
        id: column
        width: parent.width
        spacing: 0

        Repeater {
            model: server.trackedNotifications.values
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

                Layout.fillWidth: true
                Layout.preferredHeight: layout.implicitHeight + 20
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

                RowLayout {
                    id: layout
                    anchors {
                        fill: parent
                        margins: 10
                    }
                    spacing: 10

                    Image {
                        Layout.preferredWidth: 36
                        Layout.preferredHeight: 36
                        Layout.alignment: Qt.AlignTop
                        fillMode: Image.PreserveAspectFit
                        visible: source.toString() != ""
                        source: card.modelData.image || card.modelData.appIcon || ""
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 2
                        Text {
                            Layout.fillWidth: true
                            text: card.modelData.summary
                            color: Theme.primary
                            font.family: Theme.fontFamily
                            font.pixelSize: Config.bar.fontSize
                            font.bold: true
                            elide: Text.ElideRight
                        }

                        Text {
                            Layout.fillWidth: true
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
                        // console.log(card.modelData.actions);
                        // console.log(click);
                        if (click.button == Qt.LeftButton) {
                            if (card.modelData.actions && card.modelData.actions.length > 0) {
                                // console.log("should work")
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
}
