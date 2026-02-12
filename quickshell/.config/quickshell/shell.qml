// shell.qml
import Quickshell
import Quickshell.Hyprland
import "menus"

ShellRoot {
    Variants {
        model: Quickshell.screens
        Bar {
            required property var modelData
            screenObj: modelData
        }
    }

    AppLauncher {
        id: launcher
    }

    GlobalShortcut {
        name: "launcher"

        onPressed: launcher.toggle()
    }
}

