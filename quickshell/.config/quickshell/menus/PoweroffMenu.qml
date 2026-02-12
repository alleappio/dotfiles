import QtQuick
import QtQuick.Controls
import Quickshell
import qs.theme
import qs.menus

FloatingWindow {
    id: poweroffMenu

    visible: false

    Theme {
        id: theme
    }

    title: poweroffMenu 

    function toggle() {
        visible = !visible
    }

    implicitWidth: 500
    implicitHeight: 600
    color:"transparent"

    Rectangle {
        anchors.fill: parent
        radius: 5
        color: theme.colBg
        border.color: theme.colPurple
        border.width: 1
        focus: true
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                poweroffMenu.toggle();
                event.accepted = true;
            }
        }
    }
}
