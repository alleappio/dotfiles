import Quickshell
import QtQuick
import qs.Theme

Text {
    id: root
    color: Theme.foreground
    renderType: Theme.textRenderType

    signal clockClicked(var globalPos)

    font {
        family: Theme.fontFamily
        pixelSize: 15
    }

    text: Qt.formatDateTime(clock.date, "hh:mm")

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    MouseArea {
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent

        onClicked: {
            // 2. Map the local clock position relative to the main bar window
            var mappedPoint = root.mapToItem(null, 0, 0);

            // 3. Emit the signal along with its placement properties
            root.clockClicked(mappedPoint);
        }
    }
}
