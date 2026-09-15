import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.I3
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
            property bool isFocused: I3.focusedWorkspace?.number === (index + 1)
            property bool isActive: I3.workspaces.values.some(ws => ws.number === index + 1) === true
            property bool isUrgent: I3.workspaces.values.find(ws => ws.number === index + 1)?.urgent ?? false
            implicitHeight: 25
            implicitWidth: 20
            color: isUrgent ? Theme.red : (isFocused ? Theme.primary : Theme.background)
            Text {
                text: index + 1
                // Layout.fillWidth: true
                // Layout.fillHeight: true
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
                    I3.dispatch(disp.arg(index + 1));
                }
            }
        }
    }
}
