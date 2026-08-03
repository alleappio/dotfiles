import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

Text {
    id: root

    readonly property string icon: {
        return String.fromCodePoint(0xF05A);
    }

    text: icon

    color: Theme.foreground

    renderType: Theme.textRenderType

    signal infoClicked(var globalPos)

    font {
        family: Theme.fontFamily
        pixelSize: 16
    }

    MouseArea {
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent

        onClicked: {
            // 2. Map the local clock position relative to the main bar window
            var mappedPoint = root.mapToItem(null, 0, 0);

            // 3. Emit the signal along with its placement properties
            root.infoClicked(mappedPoint);
        }
    }
}
