import QtQuick
import QtQuick.Controls

Text {
    anchors.centerIn: parent
    id: clock
    property string hourFormat: "HH:mm"
    property string dateFormat: "dd/MMM/yyyy"
    property bool showDate: false
    
    // Accept theme colors as properties
    property color textColor: "#a9b1d6"
    property string fontFamily: "monospace"
    property int fontSize: 15
    
    color: textColor
    font { family: fontFamily; pixelSize: fontSize; bold: false }
    text: Qt.formatDateTime(new Date(), showDate ? dateFormat : hourFormat)
    
    renderType: Text.NativeRendering
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), clock.showDate ? clock.dateFormat : clock.hourFormat)
    }
    
    MouseArea {
        anchors.fill: parent
        onClicked: clock.showDate = !clock.showDate
    }
}
