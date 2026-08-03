import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls 2.15
import qs.Theme

RowLayout {
    id: root
    spacing: 5

    Layout.fillWidth: true
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
    Slider {
        id: volumeSlider
        Layout.fillWidth: true
        from: 0
        to: 100
        value: root.sink.audio.volume * 100

        onMoved: {
            root.sink.audio.volume = Math.min(Math.max((value / 100).toFixed(2), 0), 100);
        }
        background: Rectangle {
            x: volumeSlider.leftPadding
            y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
            implicitWidth: 200
            implicitHeight: 6 // Track height
            width: volumeSlider.availableWidth
            height: implicitHeight
            radius: 3
            color: Theme.background // Solid background color for unfilled track (or Theme.surface / "#1e1e2e")

            // Filled track progress bar (Solid Accent Color)
            Rectangle {
                width: volumeSlider.visualPosition * parent.width
                height: parent.height
                color: Theme.primary // Solid filled color
                radius: 3
            }
        }

        // 2. THE CIRCULAR HANDLE / THUMB
        handle: Rectangle {
            x: volumeSlider.leftPadding + volumeSlider.visualPosition * (volumeSlider.availableWidth - width)
            y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2

            // Exact equal width & height + radius equal to half width = Perfect Circle
            implicitWidth: 14
            implicitHeight: 14
            radius: 7

            color: volumeSlider.pressed ? Theme.primary : Theme.foreground
            border.color: Theme.primary
            border.width: 1

            Behavior on color {
                ColorAnimation {
                    duration: 100
                }
            }
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
}
