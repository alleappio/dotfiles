import QtQuick
import Quickshell.Hyprland

Text {
    id: activeWindow
    
    property color textColor: "#a9b1d6"
    property string fontFamily: "monospace"
    property int fontSize: 15
    property int maxWidth: 400
    
    color: textColor
    font { family: fontFamily; pixelSize: fontSize }
    
    text: {
        const window = Hyprland.focusedWindow;
        return window ? window.title : "Desktop";
    }
    
    elide: Text.ElideRight
    maximumLineCount: 1
    width: maxWidth
}
