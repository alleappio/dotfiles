import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Theme

RowLayout {
    id: root
    Layout.fillWidth: true
    spacing: 10
    clip: true

    readonly property MprisPlayer activePlayer: {
        const players = Mpris.players.values
        if (!players || players.length === 0) return null

        // 1. Look for a player that is currently playing
        for (let i = 0; i < players.length; i++) {
            if (players[i].isPlaying) {
                return players[i]
            }
        }

        // 2. Fallback to the first available player if all are paused/stopped
        return players[0]
    }
    readonly property string icon: String.fromCodePoint(0xF075A);
    property string shownTitle: activePlayer.trackTitle
    readonly property int speed: 40 // Pixels per second (lower = slower)
    readonly property int pauseDuration: 1500 // Pause duration in ms at start/end

    Text {
        text: root.icon
        color: Theme.foreground

        renderType: Theme.textRenderType
        font {
            family: Theme.fontFamily
            pixelSize: 15
            weight: 500
        }
    }

    Text {
        function truncateText(str, limit) {
            if (!str) return ""
            return str.length > limit ? str.slice(0, limit) + "…" : str
        }
        id: titleLabel
        text: root.shownTitle
        color: Theme.foreground
        elide: Text.ElideRight
        clip: true

        Layout.fillWidth: true
        Layout.maximumWidth: 200 // Controls maximum text expansion before eliding

        renderType: Theme.textRenderType
        font {
            family: Theme.fontFamily
            pixelSize: 15
            weight: 500
        }
    }

    Item {
        Layout.fillWidth: true
    }

    Button {
        id: backButton
        text: String.fromCodePoint(0xF013D)
        implicitWidth: 25
        implicitHeight: 25
        background: Rectangle {
            color: Theme.background
            border.color: Theme.primary // Border color
            border.width: 1             // Border thickness
            radius: 0                  // Optional: rounded corners (use 0 for sharp corners)
        }
        contentItem: Text {
            text: parent.text
            color: Theme.foreground // Set your desired foreground color here
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: 15
            }
        }
        onClicked: {
            root.activePlayer.previous()
        }
        hoverEnabled: true
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: parent.clicked() // Forward click event
        }
    }
    Button {
        id: playButton
        text:{
            if (root.activePlayer.isPlaying)
                return String.fromCodePoint(0xF03E4)
            return String.fromCodePoint(0xF040A)
        }
        implicitWidth: 25
        implicitHeight: 25
        background: Rectangle {
            color: Theme.background
            border.color: Theme.primary // Border color
            border.width: 1             // Border thickness
            radius: 0                  // Optional: rounded corners (use 0 for sharp corners)
        }
        contentItem: Text {
            text: parent.text
            color: Theme.foreground // Set your desired foreground color here
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: 15
            }
        }
        onClicked: {
            root.activePlayer.isPlaying = ! root.activePlayer.isPlaying
        }
        hoverEnabled: true
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: parent.clicked() // Forward click event
        }
    }
    Button {
        id: forwardButton
        text: String.fromCodePoint(0xF013E)
        implicitWidth: 25
        implicitHeight: 25
        background: Rectangle {
            color: Theme.background
            border.color: Theme.primary // Border color
            border.width: 1             // Border thickness
            radius: 0                  // Optional: rounded corners (use 0 for sharp corners)
        }
        contentItem: Text {
            text: parent.text
            color: Theme.foreground // Set your desired foreground color here
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font {
                family: Theme.fontFamily
                pixelSize: 15
            }
        }
        onClicked: {
            root.activePlayer.next()
        }
        hoverEnabled: true
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: parent.clicked() // Forward click event
        }
    }
}
