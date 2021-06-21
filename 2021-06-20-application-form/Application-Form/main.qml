import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    property alias firstNameLabel: firstNameLabel
    title: qsTr("Hello World")

    property string firstName: ""
    property string lastName: ""
    property string gender: ""
    property string age: "20"
//    property bool showBlack: false

    Popup{
        id: resultPopup
        closePolicy: Popup.CloseOnEscape
        anchors.centerIn: parent
        modal: true
        focus: true


        Grid{
            anchors.centerIn: parent
            id: resultGrid
            spacing: 6
            columns: 2

            Text{
                text: "First Name"
            }
            Text{
                text: firstName
            }

            Text{
                text: "Last Name"
            }
            Text{
                text: lastName
            }

            Text{
                text: "Gender"
            }
            Text{
                text: gender
            }

            Text{
                text: "Age"
            }
            Text{
                text: age
            }
        }

    }

    Column {
        id: column
        width: 200
        height: 364
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Grid {
            id: grid
            width: 242
            height: 205
            spacing: 6
            columns: 2

            Text {
                id: firstNameLabel
                text: qsTr("First Name")
                font.pixelSize: 12
                minimumPixelSize: 12

            }

            TextField {
                id: firstNameTextField
                placeholderText: qsTr("Text Field")
                onTextChanged: firstName = firstNameTextField.text
            }

            Text {
                id: lastNameLabel
                text: qsTr("Last Name")
                font.pixelSize: 12
            }

            TextField {
                id: lastNameTextField
                placeholderText: qsTr("Text Field")
                onTextChanged: lastName = lastNameTextField.text
            }

            Text {
                id: genderLabel
                text: qsTr("Text")
                font.pixelSize: 12
            }

            ComboBox {
                id: genderComboBox

                textRole: "gender"
                model: ListModel{
                    id: listModel
                    ListElement {gender: "M"}
                    ListElement {gender: "F"}
                }
                onCurrentIndexChanged: {
                    const currIndex = genderComboBox.currentIndex
                    const target = listModel.get(currIndex)
                    gender = target.gender
                }
            }

            Text {
                id: ageLabel
                text: qsTr("Age")
                font.pixelSize: 12
            }

            SpinBox {
                id: spinBox
                value:  20
                onValueChanged: {
                    age = String(spinBox.value)
                }
            }

        }

        Button {
            id: button
            text: qsTr("Click Me")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                resultPopup.open()
            }
        }
    }
//    Rectangle{
//        id: blackBackground
//        anchors.fill: parent
//        color: "black"
//        opacity: 0.4
//        visible: showBlack
//    }

}


