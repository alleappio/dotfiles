// Run with: qs -p ~/.config/quickshell/lock.qml
// Lock screen: clock above a password input, both on the left side.

import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Pam
import Quickshell.Services.UPower
import qs.Theme

ShellRoot {
    id: root

    // ---- Shared state -------------------------------------------------
    property string buffer: ""
    property bool authenticating: false
    property bool failed: false

    // ---- Theme --------------------------------------------------------
    readonly property color bg: Theme.background
    readonly property color surface: Theme.background
    readonly property color text: Theme.foreground
    readonly property color subtext: Theme.foreground
    readonly property color accent: Theme.primary
    readonly property color error: Theme.red
    readonly property string fontFamily: Theme.fontFamily

    // ---- Clock --------------------------------------------------------
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    // ---- PAM authentication ------------------------------------------
    PamContext {
        id: pam
        // Uses /etc/pam.d/login by default. Change if your distro differs
        // (e.g. "system-auth", "sddm", or a custom file).
        config: "login"

        onPamMessage: {
            if (this.responseRequired)
                this.respond(root.buffer);
        }

        onCompleted: result => {
            root.authenticating = false;
            if (result === PamResult.Success) {
                lock.locked = false;
                Qt.quit();
            } else {
                root.failed = true;
                root.buffer = "";
            }
        }
    }

    function tryUnlock() {
        if (root.authenticating || root.buffer.length === 0)
            return;
        root.authenticating = true;
        root.failed = false;
        pam.start();
    }

    // ---- Session lock -------------------------------------------------
    WlSessionLock {
        id: lock
        locked: true

        WlSessionLockSurface {
            color: root.bg

            Item {
                Image {
                    id: wallpaper
                    anchors.fill: parent
                    source: Theme.wallpaperPath
                    fillMode: Image.PreserveAspectCrop
                    smooth: true
                    visible: false
                }
                MultiEffect {
                    anchors.fill: wallpaper
                    source: wallpaper
                    autoPaddingEnabled: false
                    blurEnabled: true
                    blur: 0.5
                    blurMax: 128
                    // brightness: -0.1
                }
                anchors.fill: parent

                // Left-aligned column: clock on top, input below
                ColumnLayout {
                    anchors.left: parent.left
                    anchors.leftMargin: Math.max(48, parent.width * 0.06)
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 28

                    // Clock
                    ColumnLayout {
                        spacing: 0

                        Text {
                            text: Qt.formatDateTime(clock.date, "hh:mm")
                            color: root.text
                            renderType: Theme.textRenderType
                            font.family: root.fontFamily
                            font.pixelSize: 120
                            font.weight: Font.Bold
                        }

                        Text {
                            text: Qt.formatDateTime(clock.date, "dddd, d MMMM")
                            color: root.subtext
                            renderType: Theme.textRenderType
                            font.family: root.fontFamily
                            font.pixelSize: 24
                        }
                    }

                    // Password input
                    Rectangle {
                        Layout.preferredWidth: 360
                        Layout.preferredHeight: 40
                        radius: 0
                        color: root.surface
                        border.width: 1
                        border.color: root.failed ? root.error : input.activeFocus ? root.accent : "transparent"

                        // Behavior on border.color {
                        //     ColorAnimation {
                        //         duration: 150
                        //     }
                        // }

                        TextInput {
                            id: input
                            anchors.fill: parent
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            verticalAlignment: TextInput.AlignVCenter
                            echoMode: TextInput.Password
                            passwordCharacter: "*"
                            color: root.text
                            font.family: root.fontFamily
                            font.pixelSize: 15
                            enabled: !root.authenticating
                            focus: true

                            onTextChanged: {
                                root.buffer = text;
                                if (text.length > 0)
                                    root.failed = false;
                            }
                            onAccepted: root.tryUnlock()

                            Component.onCompleted: forceActiveFocus()

                            // Clear field when the buffer is reset after a failure
                            Connections {
                                target: root
                                function onBufferChanged() {
                                    if (root.buffer === "" && input.text !== "")
                                        input.text = "";
                                }
                            }

                            // Placeholder
                            Text {
                                anchors.fill: parent
                                verticalAlignment: Text.AlignVCenter
                                visible: input.text.length === 0
                                text: root.authenticating ? "Authenticating…" : root.failed ? "Incorrect password" : "Password"
                                color: root.failed ? root.error : root.subtext
                                renderType: Theme.textRenderType
                                font: input.font
                            }
                        }
                    }
                }
                RowLayout {
                    id: batteryRow
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: Math.max(48, parent.width * 0.06)
                    anchors.bottomMargin: 50
                    spacing: 6

                    readonly property var device: UPower.displayDevice
                    readonly property bool charging: device ? device.state === UPowerDeviceState.Charging : false
                    readonly property int level: device ? Math.round(device.percentage * 100) : 0
                    readonly property string icon: {
                        if (charging)
                            return String.fromCodePoint(0x0F1E6);
                        if (level >= 100)
                            return String.fromCodePoint(0xF0079);
                        if (level <= 10)
                            return String.fromCodePoint(0xF0083);
                        return String.fromCodePoint(0xF007A + Math.floor(level / 10) - 1);
                    }

                    Text {
                        text: batteryRow.icon
                        color: batteryRow.charging ? Theme.green : batteryRow.level <= 15 ? Theme.red : batteryRow.level <= 30 ? Theme.yellow : Theme.foreground
                        renderType: Theme.textRenderType
                        font.family: Theme.fontFamily
                        font.pixelSize: 20
                    }

                    Text {
                        text: batteryRow.level + "%"
                        color: batteryRow.charging ? Theme.green : batteryRow.level <= 15 ? Theme.red : batteryRow.level <= 30 ? Theme.yellow : Theme.foreground
                        renderType: Theme.textRenderType
                        font.family: Theme.fontFamily
                        font.pixelSize: 20
                    }
                }
            }
        }
    }
}
