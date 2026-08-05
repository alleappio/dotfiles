pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.QuickInfo.Components

PopupWindow {
    id: root
    required property var parentWindow
    readonly property int elementHeight: 40

    anchor.window: parentWindow

    visible: false
    screen: parentWindow ? parentWindow.screen : Quickshell.screens[0]
    color: Theme.background
    implicitWidth: 380
    implicitHeight: containerLayout.implicitHeight

    anchor.rect.x: parentWindow.width
    anchor.rect.y: parentWindow.height

    Rectangle {
        id: panel
        anchors.fill: parent
        color: Theme.background

        readonly property color cardBorderColor: Theme.primary

        // Outer Panel Borders
        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 1
            color: panel.cardBorderColor
            z: 1
        }

        Rectangle {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 1
            color: panel.cardBorderColor
            z: 1
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 1
            color: panel.cardBorderColor
            z: 1
        }

        ColumnLayout {
            id: containerLayout
            anchors.fill: parent // Fill the 380x380 panel completely
            spacing: 0

            Component {
                id: ramComponent
                RAM {}
            }
            Component {
                id: cpuComponent
                CPU {}
            }
            Component {
                id: networkComponent
                Network {}
            }
            Component {
                id: powerProfileComponent
                PowerProfile {}
            }
            Component {
                id: volumeComponent
                Volume {}
            }
            Component {
                id: brightnessComponent
                Brightness {}
            }
            Component {
                id: batteryComponent
                Battery {}
            }

            RowLayout {
                id: statsLayout
                Layout.fillWidth: parent // Fill the 380x380 panel completely
                spacing: 0
                Layout.preferredHeight: root.elementHeight // Define row height

                Repeater {
                    id: rowRepeater
                    model: ["ram", "cpu", "bat"]

                    Rectangle {
                        id: rowContainer

                        required property string modelData
                        // Let ColumnLayout manage positioning and height division
                        Layout.fillWidth: true
                        Layout.fillHeight: true // Automatically divides panel.height / repeater.count

                        color: Theme.background

                        // Item Borders
                        Rectangle {
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: 1
                            color: Theme.primary
                        }

                        // Rectangle {
                        //     anchors.right: parent.right
                        //     anchors.top: parent.top
                        //     anchors.bottom: parent.bottom
                        //     width: 1
                        //     color: Theme.primary
                        // }

                        Rectangle {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            height: 1
                            color: Theme.primary
                        }

                        Loader {
                            id: contentLoader
                            // anchors.fill: parent
                            anchors.centerIn: parent
                            sourceComponent: {
                                switch (rowContainer.modelData) {
                                case "ram":
                                    return ramComponent;
                                case "cpu":
                                    return cpuComponent;
                                case "bat":
                                    return batteryComponent;
                                default:
                                    return null;
                                }
                            }
                        }
                    }
                }
            }
            Repeater {
                id: columnRepeater
                model: ["vol", "brig", "pow", "network"]

                Rectangle {
                    id: columnContainer

                    required property string modelData
                    // Let ColumnLayout manage positioning and height division
                    Layout.fillWidth: true
                    // Layout.fillHeight: true // Automatically divides panel.height / repeater.count
                    Layout.preferredHeight: root.elementHeight // Define fixed height per row
                    color: Theme.background

                    // Item Borders
                    Rectangle {
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: 1
                        color: Theme.primary
                    }

                    Rectangle {
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        width: 1
                        color: Theme.primary
                    }

                    Rectangle {
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        height: 1
                        color: Theme.primary
                    }

                    Loader {
                        id: colContentLoader
                        // Check if the current item is dynamic-width (volume or brightness)
                        readonly property bool isSliderItem: columnContainer.modelData === "vol" || columnContainer.modelData === "brig"

                        // Fill full width for sliders, otherwise center the item
                        anchors.left: isSliderItem ? parent.left : undefined
                        anchors.right: isSliderItem ? parent.right : undefined
                        anchors.leftMargin: isSliderItem ? 12 : 0
                        anchors.rightMargin: isSliderItem ? 12 : 0

                        // Keep everything vertically centered
                        anchors.centerIn: isSliderItem ? undefined : parent
                        anchors.verticalCenter: isSliderItem ? parent.verticalCenter : undefined
                        // Layout.fillWidth: true
                        sourceComponent: {
                            switch (columnContainer.modelData) {
                            case "network":
                                return networkComponent;
                            case "pow":
                                return powerProfileComponent;
                            case "vol":
                                return volumeComponent;
                            case "brig":
                                return brightnessComponent;
                            default:
                                return null;
                            }
                        }
                    }
                }
            }
        }
    }
}
