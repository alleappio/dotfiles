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

    title: "appMenu"

    function toggle() {
        visible = !visible

        if (visible) {
            Qt.callLater(() => {
                prompt.textField.forceActiveFocus()
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
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 0
            spacing: 0

            Prompt{
                id: prompt
                Layout.fillWidth: true
                Layout.preferredHeight: prompt.textField.implicitHeight*2+30
                textColor: theme.colFg
                bgColor:  theme.colBg
                primaryColor:  theme.colPurple
                fontFamily: theme.fontFamily
                fontSize: launcher.fontSize

                textField.onTextChanged: {
                    applist.fuzzyQuery(textField.text)
                }
            }

            Apps{
                id: applist
                Layout.fillHeight: true 
                Layout.fillWidth: true
                textColor: theme.colFg
                bgColor:  theme.colBg
                primaryColor:  theme.colPurple
                fontFamily: theme.fontFamily
                fontSize: 20
            }
        }

        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                launcher.toggle();
                event.accepted = true;
            }
        }
    }
}
