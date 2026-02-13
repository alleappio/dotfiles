// Bar.qml
import QtQuick
import QtQuick.Layouts
import Quickshell
import "widgets" as Widgets
import "theme"

PanelWindow {
    id: root
    
    required property var screenObj
    screen: screenObj
    
    Theme {
        id: theme
    }
    
    anchors {
        top: true
        left: true
        right: true
    }
    
    margins {
        top: 5
        left: 5
        right: 5
    }
    
    implicitHeight: 32
    color: "transparent"
    
    Rectangle {
        anchors.fill: parent
        color: theme.colBg
        radius: 10
        
        RowLayout {
            anchors.fill: parent
            anchors.margins: 5
            spacing: 10
            
            // Left side widgets
            Widgets.DistroLogo {
                Layout.alignment: Qt.AlignLeft
                logoColor: theme.colFg
                fontSize: theme.fontSize
            }

            Widgets.Workspaces {
                Layout.alignment: Qt.AlignLeft
                focusColor: theme.colPurple
                activeColor: theme.colBlue
                inactiveColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Widgets.ActiveWindow {
                Layout.alignment: Qt.AlignLeft
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
                maxWidth: 10
            }
            
            // Spacer
            Rectangle { 
                Layout.fillWidth: true
                color: "transparent"
            }

            //Center
            Widgets.Clock {
                Layout.alignment: Qt.AlignCenter
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            // Spacer
            Rectangle { 
                Layout.fillWidth: true
                color: "transparent"
            }
            
            // Right side widgets
            Widgets.Audio {
                Layout.alignment: Qt.AlignRight
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Rectangle { width: 1; height: 16; color: theme.colFg }

            Widgets.Network {
                Layout.alignment: Qt.AlignRight
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Rectangle { width: 1; height: 16; color: theme.colFg }

            Widgets.PowerProfile {
                Layout.alignment: Qt.AlignRight
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Rectangle { width: 1; height: 16; color: theme.colFg }

            Widgets.Brightness{
                Layout.alignment: Qt.AlignRight
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Rectangle { width: 1; height: 16; color: theme.colFg }

            Widgets.Battery {
                Layout.alignment: Qt.AlignRight
                dischargeColor: theme.colFg
                chargeColor: theme.colGreen
                lowColor: theme.colRed
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Rectangle { width: 1; height: 16; color: theme.colFg }
            
            Widgets.Poweroff {
                Layout.alignment: Qt.AlignRight
                logoColor: theme.colFg
                
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }
        }
    }
}
