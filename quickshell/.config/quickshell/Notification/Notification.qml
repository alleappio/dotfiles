import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.Theme
import "config.js" as Config

PanelWindow {
    id: root
    required property var modelData
    screen: modelData
    NotificationServer {
        id: server
        actionsSupported: true
        bodySupported: true
        imageSupported: true
        onNotification: n => {
            n.tracked = true;
        }
    }
    anchors {
        top: true
        right: true
    }
    margins {
        top: 35
        right: 35
    }

    implicitWidth: 380
    implicitHeight: Math.max(1, column.implicitHeight)
    color: "transparent"

    exclusionMode: ExclusionMode.Ignore
    ColumnLayout {
        id: column
        width: parent.width
        spacing: 10

        Repeater {
            model: server.trackedNotifications
            delegate: Rectangle {
                id: card
                required property var modelData

                Timer {
                    running: card.modelData.urgency !== NotificationUrgency.Critical
                    interval: Config.notifications.timeout
                    onTriggered: card.modelData.dismiss()
                }

                Layout.fillWidth: true
                Layout.preferredHeight: 60
                // Layout.preferredHeight: layout.implicitHeight+20
                radius: 0
                color: Theme.background
                border.width: 1
                border.color: modelData.urgency === NotificationUrgency.Critical ? Theme.red : Theme.primary

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
                        console.log(card.modelData.actions);
                        console.log(click);
                        if (click.button == Qt.LeftButton) {
                            if (card.modelData.actions && card.modelData.actions.length > 0) {
                                console.log("should work")
                                card.modelData.actions[0].invoke();
                            }
                        } else if (click.button == Qt.RightButton) {
                            card.modelData.dismiss();
                        }
                    }
                }
            }
        }
    }
}
