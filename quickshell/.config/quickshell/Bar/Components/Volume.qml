import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

RowLayout {
    id: root
    spacing: 7

    property var sink: Pipewire.defaultAudioSink
    readonly property bool ready: sink && sink.ready
    readonly property bool muted: ready && sink.audio.muted
    readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0
    readonly property string icon: {
        if (!ready)
            return String.fromCodePoint(0xF0581);
        if (muted)
            return String.fromCodePoint(0xF466);
        if (vol === 0)
            return String.fromCodePoint(0xF0581);
        if (vol < 30)
            return String.fromCodePoint(0xF057F);
        if (vol < 60)
            return String.fromCodePoint(0xF0580);

        return String.fromCodePoint(0xF057E);
    }

    Text {
        text: root.icon
        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
            weight: 500
        }
    }

    Text {
        text: {
            if (!root.ready)
                return "~";
            if (root.muted)
                return "Muted";
            return root.vol + "%";
        }
        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: "JetbrainsMono Nerd Font"
            pixelSize: 15
            weight: 500
        }
    }
    PwObjectTracker {
        objects: [root.sink]
    }
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        // This ensures it accepts scroll wheel sequences
        onWheel: wheel => {
            if (!root.ready)
                return;

            if (wheel.angleDelta.y > 0) {
                root.sink.audio.volume = Math.min(1.0, root.sink.audio.volume + 0.05);
            } else {
                root.sink.audio.volume = Math.max(0.0, root.sink.audio.volume - 0.05);
            }
        }

        Process {
            id: powerMenuProc
            command: ["pavucontrol-qt"]
        }
        // pavucontrol-qt
        onClicked: click => {
            powerMenuProc.running = true
        }
    }
}
