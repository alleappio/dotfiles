import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    spacing: 0

    Repeater {
        id: rep
        model: 10
        Rectangle {
            id: workspace_rect
            property bool isFocused: Hyprland.focusedWorkspace?.id === (index + 1)
            property bool isActive: Hyprland.workspaces.values.some(ws => ws.id === index + 1) === true
            property bool isUrgent: Hyprland.workspaces.values.find(ws => ws.id === index + 1)?.urgent ?? false
            implicitHeight: 25
            implicitWidth: 20
            color: isUrgent ? Theme.red : (isFocused ? Theme.primary : Theme.background)
            Text {
                text: index + 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.centerIn: parent
                renderType: Theme.textRenderType
                color: isUrgent ? Theme.black : (isFocused ? Theme.black : (isActive ? Theme.foreground : Theme.black))
                font {
                    family: Theme.fontFamily
                    pixelSize: 15
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: click => {
                    let disp = "hl.dsp.focus({workspace=%1})";
                    Hyprland.dispatch(disp.arg(index + 1));
                }
            }
        }
    }
}
