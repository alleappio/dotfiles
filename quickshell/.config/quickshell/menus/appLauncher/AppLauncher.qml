import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.theme
import qs.menus.appLauncher

FloatingWindow {
    id: launcher

    visible: false

    Theme {id: theme}
    ApplicationProvider{ id:applicationProvider }

    title: "appMenu"

    function toggle() {
        visible = !visible

        if (visible) {
            Qt.callLater(() => {
                searchField.textField.forceActiveFocus()
            })
        }
    }

    implicitWidth: 500
    implicitHeight: 600
    color:"transparent"

    property int fontSize: 25

    Rectangle {
        anchors.fill: parent
        radius: 5
        color: theme.colBg
        border.color: theme.colPurple
        border.width: 1
        focus: true
        
        Prompt{
            id:searchField
            textColor: theme.colFg
            bgColor:  theme.colBg
            primaryColor:  theme.colPurple
            fontFamily: theme.fontFamily
            fontSize: launcher.fontSize
        }

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                launcher.toggle();
                event.accepted = true;
            }
        }
    }
}
