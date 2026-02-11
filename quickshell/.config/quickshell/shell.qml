// shell.qml
import Quickshell

ShellRoot {
    Variants {
        model: Quickshell.screens
        Bar {
            required property var modelData
            screenObj: modelData
        }
    }
}
