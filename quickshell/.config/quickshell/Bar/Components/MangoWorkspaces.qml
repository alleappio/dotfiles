import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Services

RowLayout {
    id: root
    spacing: 0

    // Automatically find the monitor name associated with this bar/window
    // (Falls back to the first monitor if screen info isn't directly bound)
    // property string currentMonitor: {
    //     // Try to match Quickshell's window screen name if available, otherwise default
    //     let screenObj = root.Window ? root.Window.screen : (Quickshell.screens.length > 0 ? Quickshell.screens[0] : null);
    //     return screenObj ? screenObj.name : "HDMI-A-2";
    // }
    required property string monitorName;

    // Get the tags list for this specific monitor from the MangoWM service
    readonly property var monitorTags: MangoService.getTagsForMonitor(root.monitorName)

    Repeater {
        id: rep
        // Show 9 tags as standard, matching your layout
        model: 9

        Rectangle {
            id: workspace_rect

            // Find tag data for this specific index (1-based)
            readonly property var tagData: {
                for (let i = 0; i < root.monitorTags.length; i++) {
                    if (root.monitorTags[i].index === (index + 1)) {
                        return root.monitorTags[i];
                    }
                }
                return null;
            }

            property bool isFocused: tagData ? tagData.is_active : false
            property bool isActive: tagData ? (tagData.client_count > 0 || tagData.is_active) : false
            property bool isUrgent: tagData ? tagData.is_urgent : false

            implicitHeight: 25
            implicitWidth: 20
            color: isUrgent ? Theme.red : (isFocused ? Theme.primary : Theme.background)

            Text {
                text: index + 1
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
                onClicked: {
                    // Call the service helper to dispatch the tag change for this monitor
                    MangoService.setTag(root.monitorName, index + 1);
                }
            }
        }
    }
}
