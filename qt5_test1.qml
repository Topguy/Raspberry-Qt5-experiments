//Very simple QML test borrowed from Qt docs.
//Will be expanded if needed.

import QtQuick 2.3


Rectangle {
    width: 200
    height: 100
    color: "red"

    Text {
        anchors.centerIn: parent
        text: "Hello, World!"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.color = "blue"
    }
}


