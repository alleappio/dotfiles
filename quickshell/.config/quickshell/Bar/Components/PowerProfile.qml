import Quickshell
import Quickshell.Io
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls // <--- Add this line!
import qs.Theme

RowLayout {
    // 0 -> power saver
    // 1 -> balanced
    // 2 -> performance
    id: root
    property var powerProfile: PowerProfiles.profile
    property string icon: {
        if (powerProfile === PowerProfile.PowerSaver)
            return String.fromCodePoint(0xF06C);
        if (powerProfile === PowerProfile.Balanced)
            return String.fromCodePoint(0xF24E);
        if (powerProfile === PowerProfile.Performance)
            return String.fromCodePoint(0xF140B);
    }
    property string label: {
        if (powerProfile === 0)
            return "Eco";
        if (powerProfile === 1)
            return "Bal";
        if (powerProfile === 2)
            return "Pow";
    }

    Text {
        text: icon
        color: Theme.foreground
        renderType: Theme.textRenderType

        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 20
        }

        // This makes the Text element clickable
        TapHandler {
            onTapped: {
                console.log("Text was clicked!");
                // Put your action here (e.g., executing a hyprland dispatch command)
            }
        }
    }

    Text {
        text: label
        color: Theme.foreground
        renderType: Theme.textRenderType

        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
        }

        // This makes the Text element clickable
        TapHandler {
            onTapped: {
                console.log("Text was clicked!");
                // Put your action here (e.g., executing a hyprland dispatch command)
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: mouse => {
            if (root.powerProfile == PowerProfile.PowerSaver) {
                PowerProfiles.profile = PowerProfile.Balanced;
            } else if (root.powerProfile == PowerProfile.Balanced) {
                PowerProfiles.profile = PowerProfile.Performance;
            } else if (root.powerProfile === PowerProfile.Performance) {
                PowerProfiles.profile = PowerProfile.PowerSaver;
            }
        }
    }
}
