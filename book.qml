import QtQuick 2.0

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick 2.0

//import io.qt.examples 1.0

ApplicationWindow {
    id: bookWindow
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    width: 973
    height: 480
    title: qsTr("Book")
    color:"#010d24"

    Reservation{
        id:rev
    }


    function checkInformation(){
        if(book_firstname.length == 0){
            warning_bg.visible = true
            warning.text= "please enter your first name."
            return false
        }else if(book_lastname.length == 0){
            warning_bg.visible = true
            warning.text= "please enter your last name."
            return false
        }else if(book_email.length == 0){
            warning_bg.visible = true
            warning.text= "please enter your email."
            return false
        }else{
            return true
        }

    }

        Rectangle {
            id: rectangle
            x: 204
            y: 251
            width: 566
            height: 52
            color: "#75dbe3ec"

            Text {
                id: luggage
                x: 0
                y: -25
                color: "#f1f0f0"
                text: qsTr("Luggage")
                font.bold: true
                font.pixelSize: 16
            }

            ComboBox {
                id: hand_luggage
                x: 128
                y: 7
                textRole: "key"
                model:
                    ListModel{
                    id:listmodel_handLuggage
                    ListElement{key:"1";value:"true"}
                    //ListElement{key:"2";value:"false"}
                    //ListElement{key:"3";value:"false"}
                }

            }


            Text {
                id: hand_lug
                x: 13
                y: 15
                color: "#dad4d4"
                text: qsTr("Hand Luggage")
                font.pixelSize: 13
            }

            Text {
                x: 304
                y: 15
                color: "#dad4d4"
                text: qsTr("Checked Luggage")
                font.pixelSize: 13
            }

            ComboBox {
                id: checked_luggage
                x: 419
                y: 7
                textRole: "key"
                model:
                    ListModel{
                    id:listmodel_checkedLuggage
                    ListElement{key:"0";value:"true"}
                    ListElement{key:"1";value:"false"}
                    ListElement{key:"2";value:"false"}
                    ListElement{key:"3";value:"false"}
                }
            }


        }

        Rectangle {
            id: passagner_info
            x: 204
            y: 74
            width: 566
            height: 131
            color: "#75dbe3ec"



            TextField {
                id: book_email
                x: 59
                y: 91
                width: 188
                height: 22
                placeholderText: qsTr("Email")
            }

            ComboBox {
                id: book_gender
                x: 59
                y: 44
                textRole: "gender"
                model:
                    ListModel{
                    id:listmodel_gender
                    ListElement{gender:"Male";value:"Male"}
                    ListElement{gender:"Female";value:"Female"}
                }
            }

            TextField {
                id: book_lastname
                x: 134
                y: 8
                placeholderText: qsTr("LastName")
            }

            TextField {
                id: book_firstname
                x: 8
                y: 8
//                placeholderText: qsTr("First Name")
            }

            Text {
                id: element3
                x: 8
                y: 52
                color: "#ece5e5"
                text: qsTr("Gender")
                font.pixelSize: 13
            }

            Text {
                id: element4
                x: 0
                y: -25
                color: "#e9e3e3"
                text: qsTr("Passagner Info")
                font.bold: true
                font.pixelSize: 16
            }

            Text {
                id: element5
                x: 8
                y: 94
                color: "#ece5e5"
                text: qsTr("Email")
                font.pixelSize: 13
            }





        }
        Button {
            id: book_confirm
            x: 415
            y: 343
            width: 144
            height: 36
            text: qsTr("Confirm")
            onClicked: {
                if(checkInformation()){
                    rev.passengerName= book_firstname.text + " " + book_lastname.text
                    rev.passengerGender = book_gender.currentText
                    rev.passengerMail = book_email.text
                    rev.luggageNumber = checked_luggage.currentText
                    //element5.text = rev.passengerName
                //bookWindow.close()
                //pageLoader.source = "" // Clearing first
                //pageLoader.source = "confirm.qml"
                    window.pageStack.push(confirmWindow, {rev}, true)
                    //pageLoader.source = "confirm.qml"
                }

            }
        }



        Rectangle {
            id: warning_bg
            visible: false
            x: 253
            y: 414
            width: 403
            height: 36
            color: "#99e99292"
            radius: 15

            Text {
                id: warning
                x: 76
                y: 11
                width: 251
                height: 15
                color: "#fbfbfb"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 17
            }
        }

        Button {
            id: back_button
            x: 28
            y: 18
            width: 62
            height: 26
            text: qsTr("BACK")
            enabled: true
            checkable: false
            onClicked:
            {
                bookWindow.close()
                pageLoader.source = "" // Clearing first
                pageLoader.source = "search.qml"
            }
        }

}
