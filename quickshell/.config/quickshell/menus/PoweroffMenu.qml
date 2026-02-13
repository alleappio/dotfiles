import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import qs.theme
import qs.menus

FloatingWindow {
    id: poweroffMenu

    property int fontSize: 30

    visible: false

    Theme {
        id: theme
    }

    title: poweroffMenu 

    function toggle() {
        visible = !visible
    }

    implicitWidth: 400
    implicitHeight: 200
    color:"transparent"

    Rectangle {
        anchors.fill: parent
        radius: 5
        color: theme.colBg
        border.color: theme.colPurple
        border.width: 0
        focus: true
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                poweroffMenu.toggle();
                event.accepted = true;
            }
        }
        RowLayout {
            anchors.fill: parent
            spacing: 2

            PowerButton {
                icon: "⏻"
                colButton: theme.colLightBg 
                colIcon: theme.colFg
                colBg: theme.colBg
                fontFamily: theme.fontFamily 
                iconSize: fontSize 
                clickAction: Hyprland.dispatch("exec poweroff")
            }

            PowerButton {
                icon: ""
                colButton: theme.colLightBg 
                colIcon: theme.colFg
                colBg: theme.colBg
                fontFamily: theme.fontFamily 
                iconSize: fontSize 
                clickAction: Hyprland.dispatch("exec reboot")
            }

            PowerButton {
                icon: "󰗽"
                colButton: theme.colLightBg 
                colIcon: theme.colFg
                colBg: theme.colBg
                fontFamily: theme.fontFamily 
                iconSize: fontSize 
                clickAction: Hyprland.dispatch("exit")
            }
        }
    }
}
