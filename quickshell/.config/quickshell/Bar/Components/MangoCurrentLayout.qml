import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Services

Text {
    required property string monitorName
    text: " | [" +MangoService.getLayoutForMonitor(monitorName) + "]"
    color: Theme.foreground

    renderType: Theme.textRenderType

    font {
        family: Theme.fontFamily
        pixelSize: 15
    }
}
