import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    id: root
    spacing: 6

    property var battery: UPower.displayDevice
    property bool charging: battery.state === UPowerDeviceState.Charging
    readonly property int level: Math.round(battery.percentage * 100)
    readonly property string icon: {
        if (charging)
            return String.fromCodePoint(0x0F1E6);
        if (level >= 100)
            return String.fromCodePoint(0xF0079);
        if (level <= 10)
            return String.fromCodePoint(0xF0083);
        return String.fromCodePoint(0xF007A * Math.floor(level / 10) - 1);
    }

    Text {
        text: root.icon
        color: root.charging ? Theme.green : root.level <= 15 ? Theme.red : root.level <= 30 ? Theme.yellow : Theme.foreground

        renderType: Theme.textRenderType

        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
        }
    }

    Text {
        text: root.level + "%"

        color: root.charging ? Theme.green : root.level <= 15 ? Theme.red : root.level <= 30 ? Theme.yellow : Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
        }
    }
}
