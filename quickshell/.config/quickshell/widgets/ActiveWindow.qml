import QtQuick
import Quickshell.Hyprland
import Quickshell

Text {
    required property color textColor
    required property string fontFamily
    required property int fontSize
    required property int maxWidth

    id: activeWindow
    
    color: textColor
    renderType: Text.NativeRendering
    font { family: fontFamily; pixelSize: fontSize }
    
    text: {
        const window = Hyprland.activeToplevel.title;
        var toDisplay = window.slice(0,maxWidth)
        if(window.length>toDisplay.length){
            toDisplay = toDisplay+"..."
        }
        return toDisplay ? toDisplay : "Desktop";
    }
    
    elide: Text.ElideRight
    maximumLineCount: 1
    width: maxWidth
}
