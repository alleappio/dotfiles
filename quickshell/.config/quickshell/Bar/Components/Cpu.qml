import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Services

RowLayout {
    id: root
    spacing: 6

    readonly property string icon: {
        return String.fromCodePoint(0xF035B);
    }

    Text {
        text: root.icon
        color: Theme.foreground

        renderType: Theme.textRenderType

        font {
            family: Theme.fontFamily
            pixelSize: 15
        }
    }

    Text {
        text: StatsService.cpuUsage + "%"

        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: Theme.fontFamily
            pixelSize: 15
        }
    }
}
