import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme // To pull in Theme variables
import qs.Services

Item {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    property string icon: {
        let sum = Math.floor((14*BrightnessService.brightness)/100);
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

    // 5. Interaction layer to intercept scrolling over the widget
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onWheel: wheel => {
            if (wheel.angleDelta.y > 0) {
                BrightnessService.setBrightness(BrightnessService.brightness+5)
            } else if (wheel.angleDelta.y < 0) {
                BrightnessService.setBrightness(BrightnessService.brightness-5)
            }
        }
    }
}
