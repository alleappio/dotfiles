import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    spacing: 10

    Repeater {
        model: 10

        Text {
            property bool isFocused: Hyprland.focusedWorkspace?.id === (index + 1)
            property bool isActive: Hyprland.workspaces.values.some(ws => ws.id === index + 1) === true
            property bool isUrgent: Hyprland.workspaces.values.find(ws => ws.id === index + 1)?.urgent ?? false
            text: index + 1

            renderType: Theme.textRenderType
            color: isUrgent ? Theme.red : (isFocused ? Theme.primary : (isActive ? Theme.foreground : Theme.black))
            font {
                family: "JetbrainsMono Nerd Font"
                pixelSize: 15
            }
            MouseArea {
                anchors.fill: parent
                onClicked: click => {
                    let disp = "hl.dsp.focus({workspace=%1})";
                    Hyprland.dispatch(disp.arg(index+1));
                }
            }
        }
    }
}
