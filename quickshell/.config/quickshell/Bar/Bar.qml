import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Bar.Components
import qs.Theme

PanelWindow {
    id: barWindow

    required property var modelData
    screen: modelData

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 25
    color: Theme.background

    Calendar {
        id: globalCalendar
        parentWindow: barWindow
    }
    RowLayout {

        anchors.fill: parent
        anchors.leftMargin: 14
        anchors.rightMargin: 14

        RowLayout {
            spacing: 10
            Logo {}
            Workspaces {}
        }
        Spacer {}
        RowLayout {
            anchors.centerIn: parent
            Clock {
                onClockClicked: globalPos => {
                    console.log("Ahoi");
                    if (globalCalendar.visible) {
                        globalCalendar.visible = false;
                    } else {
                        globalCalendar.visible = true;
                    }
                }
            }
        }
        Spacer {}
        RowLayout {
            spacing: 20
            // SysTray {}
            Cpu {}
            Ram {}
            PowerProfile {}
            Network {}
            Volume {}
            Brightness {}
            Battery {}
            PowermenuButton {}
        }
    }
}
