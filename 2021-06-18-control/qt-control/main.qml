import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    BusyIndicator {
        id: busyIndicator
        x: 290
        y: 210
    }

    Label {
        id: label
        x: 280
        y: 179
        width: 81
        height: 25
        text: qsTr("Progress = ") + busyIndicator.running
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        MouseArea {
            id: mouseArea
            width: 100
            height: 100
            anchors.fill: parent
            onClicked: {

                busyIndicator.running = ! busyIndicator.running

            }
        }
    }
}
