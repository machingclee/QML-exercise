import QtQuick 2.15
import QtQuick.Window 2.15
import com.company.cat 1.0
import QtQuick.Controls 2.5

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Popup{
        id: namePopup
        modal:true
        focus: true
        closePolicy: Popup.CloseOnEscape
        anchors.centerIn: parent


        Label{
            text: "name changed to "+ cat.name
            anchors.centerIn: parent
        }
    }

    Popup{
        id: meowPopup
        modal:true
        focus: true
        closePolicy: Popup.CloseOnEscape
        anchors.centerIn: parent

        Label{
            text: "meow!"
            anchors.centerIn: parent
        }
    }

    Cat {
        id: cat
        onMeowed: {
            meowPopup.open()
        }
        onNameChanged: {
            namePopup.open()
        }
    }

    Column{
        id: column
        width: 199
        height: 208
        anchors.verticalCenter: parent.verticalCenter
        spacing: 6
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: nameLabel
            width: 80
            height: 20
            text:"Name"
            font.pixelSize: 16
        }

        TextField {
            id: nameTextField
            placeholderText: qsTr("Name")
        }

        Button {
            id: changeButton
            text: qsTr("change")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                cat.changeName(nameTextField.text)
            }
        }

        Button {
            id: callButton
            text: qsTr("meow")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                cat.meowed()
            }
        }

    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
