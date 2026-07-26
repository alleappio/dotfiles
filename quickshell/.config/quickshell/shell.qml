//@ pragma UseQApplication
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import qs.Bar
import qs.Bar.Components
import qs.Notification
import qs.Theme

ShellRoot {
    Variants {
        model: Quickshell.screens
        required property var modelData
        Bar {}
    }

    Variants {
        model: Quickshell.screens
        required property var modelData
        Notification {}
    }
}
