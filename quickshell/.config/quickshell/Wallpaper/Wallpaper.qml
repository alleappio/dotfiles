import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.Theme

PanelWindow {
        id: wallpaperWindow
        required property var modelData
        screen: modelData
        // Anchor to all 4 edges of the screen
        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        // Push the window to the Wayland 'Background' layer (behind normal windows)
        WlrLayershell.layer: WlrLayer.Background

        // Load your image
        Image {
            anchors.fill: parent

            // File path: local relative path or absolute URL file:///path/to/image.png
            source: Theme.wallpaperPath

            // Preserves aspect ratio while cropping to fill the screen space
            fillMode: Image.PreserveAspectCrop

            // Smoothly interpolate pixels when scaling
            smooth: true
        }
    }
