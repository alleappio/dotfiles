// shell.qml
import Quickshell
import Quickshell.Hyprland
import qs.menus.appLauncher as App
import qs.menus as Menus

ShellRoot {
    Variants {
        model: Quickshell.screens
        Bar {
            required property var modelData
            screenObj: modelData
        }
    }

    Menus.PoweroffMenu {
        id: poweroffMenu
    }

    App.AppLauncher {
        id: launcher
    }

    GlobalShortcut {
        name: "launcher"

        onPressed: launcher.toggle()
    }

    GlobalShortcut {
        name: "poweroff_menu"

        onPressed: poweroffMenu.toggle()
    }
}

