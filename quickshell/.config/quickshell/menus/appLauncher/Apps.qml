import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland
import qs.menus.appLauncher

Item {
    id: apps
    required property color textColor
    required property color bgColor
    required property color primaryColor
    required property string fontFamily
    required property int fontSize

    readonly property list<DesktopEntry> list: Array.from(DesktopEntries.applications.values)
        .filter((app, index, self) => 
            index === self.findIndex((t) => (
                t.id === app.id
            ))
    )

    //Thanks end-4 for the fuzzy search and the app listing
    readonly property var preppedNames: list.map(a => ({
        name: Fuzzy.prepare(`${a.name} `),
        entry: a
    }))

    readonly property var preppedIcons: list.map(a => ({
        name: Fuzzy.prepare(`${a.icon} `),
        entry: a
    }))

    property var searchedApp

    function fuzzyQuery(search: string): var {
        apps.searchedApp = Fuzzy.go(search, preppedNames, {
            all: true,
            key: "name"
        }).map(r => {
            return r.obj.entry
        });
    }
    

    Rectangle { 
        clip: false
        ColumnLayout {
            id: appColumns
            spacing:30
            Repeater {
                model: apps.searchedApp
                Rectangle {
                    //Layout.alignment: Qt.AlignLeft
                    //Layout.fillWidth: true
                    //Layout.preferredHeight: 20
                    border.width: 1
                    border.color: apps.primaryColor
                    color: "transparent"
                    Text {
                        anchors.left: appIcon.right
                        anchors.leftMargin: 20
                        anchors.verticalCenter: parent.verticalCenter
                        font { family: apps.fontFamily; pixelSize: apps.fontSize; bold: true }
                        renderType: Text.NativeRendering
                        color:apps.textColor
                        text:{
                            return modelData.name
                        }
                    }
                    Image {
                        id: appIcon
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        width: 24
                        height: 24
                        source: Quickshell.iconPath(modelData.icon,true)
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        fuzzyQuery("")
        
    }
}
