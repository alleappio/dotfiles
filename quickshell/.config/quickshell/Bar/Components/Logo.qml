import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Theme

Text {
    id: root

    // Default fallback until os-release is read
    property string distroId: "arch"

    text: {
        switch (root.distroId.toLowerCase()) {
        case "arch":
            return String.fromCodePoint(0xF08C7); // Arch Linux
        case "fedora":
            return String.fromCodePoint(0xE7D9);  // Fedora
        case "debian":
            return String.fromCodePoint(0xF306);  // Debian
        case "nixos":
            return String.fromCodePoint(0xF313);  // NixOS
        case "void":
            return String.fromCodePoint(0xF32E);  // Void linux
        default:
            return String.fromCodePoint(0xF303);  // Generic Linux fallback
        }
    }

    color: Theme.foreground
    renderType: Theme.textRenderType

    font {
        family: Theme.fontFamily
        pixelSize: 15
    }

    // Process to read the distro ID from /etc/os-release on startup
    Process {
        id: distroProc
        command: ["sh", "-c", ". /etc/os-release && echo $ID"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                let trimmed = data.trim();
                if (trimmed.length > 0) {
                    root.distroId = trimmed;
                }
            }
        }
    }

    Process {
        id: launcherProc
        command: ["/home/alle/.config/rofi/scripts/main_menu.sh"]
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked: mouse => {
            launcherProc.running = true;
        }
    }
}
