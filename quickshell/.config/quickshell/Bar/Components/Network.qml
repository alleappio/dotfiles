import Quickshell
import Quickshell.Io
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    id: root
    spacing: 6

    property var wifiDevice: Networking.devices.values.find(d => d?.type === DeviceType.Wifi)
    property var ethDevice: Networking.devices.values.find(d => d?.type === DeviceType.Wired)
    property var wifiConn: wifiDevice?.networks?.values?.find(n => n.connected) ?? null
    property var ethConn: ethDevice?.networks.values.find(n => n.connected)
    readonly property var active: ethConn ? ethConn : wifiConn
    readonly property int activeDevice: ethConn ? 0 : wifiConn ? 1 : -1
    readonly property real signal: active ? active.signalStrength : 0
    readonly property string icon: {
        if (activeDevice === 0) {
            return String.fromCodePoint(0xF0200);
        }
        if (activeDevice === 1) {
            let tier = signal >= 0.75 ? 4 : signal >= 0.50 ? 3 : signal >= 0.25 ? 2 : 1;
            return String.fromCodePoint(0xF091F + (tier - 1) * 3);
        } else
            return String.fromCodePoint(0xF092D);
    }

    Text {
        text: root.icon
        color: Networking.wifiEnabled ? Theme.foreground : Theme.black

        renderType: Theme.textRenderType
        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
            weight: 500
        }
    }
    Text {
        text: {
            if (!Networking.wifiEnabled)
                return "off";
            if (!root.active)
                return "Disconnected";
            return root.active.name;
        }

        renderType: Theme.textRenderType
        color: Theme.foreground

        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
            weight: 500
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        Process {
            id: nmtuiProc
            command: ["sh", "-c", "alacritty --class nmtui -e nmtui"]
        }
        onClicked: click => {
            nmtuiProc.running = true;
        }
    }
}
