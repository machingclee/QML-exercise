import QtQuick 2.0
import QtQuick.Controls 2.15




Item {
    id: genieItem
    anchors.centerIn: parent

    Item{
        id: dataStore
        property int from: 0
        property int to: 100
        property int generatedNumber: 0
        signal sliderChanged(int from, int to)
        signal generateNumber()

        onSliderChanged: {
            dataStore.from = from
            dataStore.to = to
        }

        onGenerateNumber: {
            dataStore.generatedNumber = dataStore.from + Math.floor(Math.random()*(dataStore.to-dataStore.from))
        }
    }




    Column {
        id: column
        x: 0
        y: 0
        width: 466
        height: 250
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        spacing:12

        Label {
            id: rangeLabel
            text:  dataStore.from + " to " +  dataStore.to
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
        }

        RangeSlider {
            id: rangeSlider
            width: 350
            from: 1
            to:100
            first.value: 0
            second.value: 100
            topPadding: 19
            anchors.horizontalCenter: parent.horizontalCenter

            first.onMoved: {
                const from = Math.round(rangeSlider.first.value)
                const to = Math.round(rangeSlider.second.value)

                dataStore.sliderChanged(from, to)
            }

            second.onMoved: {
                const from = Math.round(rangeSlider.first.value)
                const to = Math.round(rangeSlider.second.value)
                dataStore.sliderChanged(from, to)
            }


        }

        Button {
            id: generateButton
            text: qsTr("generate")
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: dataStore.generateNumber()
        }

        Label {
            id: resultLabel
            text: dataStore.generatedNumber
            topPadding: 21
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
