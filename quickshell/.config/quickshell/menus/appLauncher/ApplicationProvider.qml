import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland

Item {
    id: applicationProvider
    function getAppList() {
        return ["dio", "cane", "porco"]
    }
}
