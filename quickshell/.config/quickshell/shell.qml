// shell.qml
import Quickshell
import Quickshell.Hyprland
import qs.menus.appLauncher as App

ShellRoot {
    Variants {
        model: Quickshell.screens
        Bar {
            required property var modelData
            screenObj: modelData
        }
    }

    App.AppLauncher {
        id: launcher
    }

    GlobalShortcut {
        name: "launcher"

        onPressed: launcher.toggle()
    }
}

