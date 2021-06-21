import QtQuick 2.12
import QtQuick.Window 2.12

Window {

    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Rectangle{
        id: moveTarget
        width: 100
        height: 100
        color: "red"
        x: parent.width/2-50
        y: parent.height/2-50
        focus: true

        Keys.onLeftPressed:{
            moveTarget.x = moveTarget.x-10
        }
        Keys.onRightPressed:{
            moveTarget.x = moveTarget.x+10
        }
        Keys.onUpPressed:{
            moveTarget.y = moveTarget.y-10
        }
        Keys.onDownPressed:{
            moveTarget.y = moveTarget.y+10
        }
    }


}

