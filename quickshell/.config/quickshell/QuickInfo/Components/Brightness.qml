import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls 2.15
import qs.Theme // To pull in Theme variables
import qs.Services

Item {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    property string icon: {
        let sum = Math.floor((14 * BrightnessService.brightness) / 100);
        return String.fromCodePoint(0xe3d5 + sum);
    }

    RowLayout {
        id: layout
        anchors.fill: parent
        spacing: 6

        // Sun / Brightness Icon
        Text {
            text: icon // Nerd Font Sun icon
            color: Theme.foreground
            renderType: Theme.textRenderType
            font {
                family: Theme.fontFamily
                pixelSize: 15
                weight: 500
            }
        }

        Slider {
            id: brightnessSlider
            Layout.fillWidth: true
            from: 0
            to: 100
            value: BrightnessService.brightness

            onMoved: {
                BrightnessService.setBrightness(value)
            }

            background: Rectangle {
                x: brightnessSlider.leftPadding
                y: brightnessSlider.topPadding + brightnessSlider.availableHeight / 2 - height / 2
                implicitWidth: 200
                implicitHeight: 6 // Track height
                width: brightnessSlider.availableWidth
                height: implicitHeight
                radius: 3
                color: Theme.background // Solid background color for unfilled track (or Theme.surface / "#1e1e2e")

                // Filled track progress bar (Solid Accent Color)
                Rectangle {
                    width: brightnessSlider.visualPosition * parent.width
                    height: parent.height
                    color: Theme.primary // Solid filled color
                    radius: 3
                }
            }

            // 2. THE CIRCULAR HANDLE / THUMB
            handle: Rectangle {
                x: brightnessSlider.leftPadding + brightnessSlider.visualPosition * (brightnessSlider.availableWidth - width)
                y: brightnessSlider.topPadding + brightnessSlider.availableHeight / 2 - height / 2

                // Exact equal width & height + radius equal to half width = Perfect Circle
                implicitWidth: 14
                implicitHeight: 14
                radius: 7

                color: brightnessSlider.pressed ? Theme.primary : Theme.foreground
                border.color: Theme.primary
                border.width: 1

                Behavior on color {
                    ColorAnimation {
                        duration: 100
                    }
                }
            }
        }
        // Percentage Output text
        Text {
            text: BrightnessService.brightness + "%"
            color: Theme.foreground
            renderType: Theme.textRenderType
            font {
                family: Theme.fontFamily
                pixelSize: 15
                weight: 500
            }
        }
    }
}
