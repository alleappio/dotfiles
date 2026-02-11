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
            spacing: 12
            
            // Left side widgets
            Widgets.DistroLogo {
                logoColor: theme.colFg
                fontSize: theme.fontSize
            }

            Widgets.Workspaces {
                focusColor: theme.colPurple
                activeColor: theme.colBlue
                inactiveColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            Widgets.ActiveWindow {
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
                maxWidth: 400
            }
            
            // Spacer
            Item { Layout.fillWidth: true }

            //Center
            Widgets.Clock {
                textColor: theme.colFg
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            // Spacer
            Item { Layout.fillWidth: true }
            
            // Right side widgets
            Widgets.Battery {
                dischargeColor: theme.colFg
                chargeColor: theme.colGreen
                lowColor: theme.colYellow
                fontFamily: theme.fontFamily
                fontSize: theme.fontSize
            }

            
            Widgets.SystemTray {}
        }
    }
}
