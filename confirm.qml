import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick 2.0
//import Reservation.qml

//import io.qt.examples 1.0

ApplicationWindow {
    id: confirmWindow
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    width: 973
    height: 480
    title: qsTr("Confirm")
    color:"#010d24"

    Reservation{
        id:rev
    }

        Button {
            id: back_button2
            x: 28
            y: 18
            width: 62
            height: 26
            text: qsTr("BACK")
            enabled: true
            checkable: false
            onClicked:
            {
                confirmWindow.close()
                pageLoader.source = "" // Clearing first
                pageLoader.source = "book.qml"
            }
        }


        Rectangle {
            id: confirm_flightInfo_bg
            x: 144
            y: 78
            width: 602
            height: 98
            color: "#ffffff"

            Text {
                id: confirm_departure_time
                x: 14
                y: 27
                width: 91
                height: 22
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 15
                text: rev.departureTime
            }

            Text {
                id: confirm_arrive_time
                x: 140
                y: 27
                width: 87
                height: 22
                text: rev.arriveTime
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: confirm_element
                x: 96
                y: 26
                width: 35
                height: 11
                text: qsTr("-->")
                font.bold: false
                font.pixelSize: 16
            }

            Text {
                id: confirm_flightID
                x: 85
                y: 48
                font.pixelSize: 14
                text: rev.flightID
            }

            Text {
                id: confirm_d_city
                x: 246
                y: 38
                text: rev.departureCity
                font.pixelSize: 15
            }

            Text {
                id: confirm_a_city
                x: 335
                y: 38
                text: rev.arriveCity
                font.pixelSize: 15
            }
        }



        //passagner info
        Rectangle {
            id: confirm_passagner_info
            x: 144
            y: 225
            width: 288
            height: 92
            color: "#75dbe3ec"

            Text {
                id: confirm_gender
                x: 70
                y: 39
                color: "#ece5e5"
                text: rev.passengerGender
                font.pixelSize: 13
            }

            Text {
                id: confirm_element4
                x: 0
                y: -25
                color: "#e9e3e3"
                text: qsTr("Passagner Info")
                font.bold: true
                font.pixelSize: 16
            }

            Text {
                id: confirm_element11
                x: 11
                y: 60
                color: "#eeebeb"
                text: qsTr("Email:")
                font.bold: true
                font.pixelSize: 13
            }

            Text {
                id: confirm_email
                x: 70
                y: 61
                width: 180
                height: 15
                color: "#f2ebeb"
                text: rev.passengerMail
                font.pixelSize: 13
            }

            Text {
                id: confirm_name
                x: 70
                y: 12
                width: 114
                height: 15
                color: "#fdfdfd"
                text: rev.passengerName
                font.pixelSize: 12
            }

            Text {
                id: name
                x: 11
                y: 11
                color: "#eeebeb"
                text: qsTr("Name:")
                font.bold: true
                font.pixelSize: 13
            }

            Text {
                id: name1
                x: 11
                y: 38
                color: "#eeebeb"
                text: qsTr("Gender:")
                font.bold: true
                font.pixelSize: 13
            }
        }

        //luggage info
        Rectangle {
            id: confirm_rectangle
            x: 475
            y: 225
            width: 271
            height: 92
            color: "#75dbe3ec"

            Text {
                id: confirm_luggage
                x: 0
                y: -25
                color: "#f1f0f0"
                text: qsTr("Luggage and Seat")
                font.bold: true
                font.pixelSize: 16
            }



            Text {
                id: confirm_handLuggage
                x: 13
                y: 15
                color: "#dad4d4"
                text: qsTr("Seat")
                font.pixelSize: 13
            }

            Text {
                id: confirm_element2
                x: 13
                y: 54
                color: "#dad4d4"
                text: qsTr("Checked Luggage")
                font.pixelSize: 13
            }

            Text {
                id: confirm_handluggage_number
                x: 137
                y: 15
                color: "#fdfdfd"
                text: rev.seatNumber
                font.pixelSize: 13
            }

            Text {
                id: confirm_checkedluggage_number
                x: 137
                y: 54
                color: "#fdfdfd"
                text: rev.luggageNumber
                font.pixelSize: 13
            }

        }

        Button {
            id: payment
            x: 634
            y: 359
            width: 112
            height: 45
            text: qsTr("payment")
        }

        Rectangle {
            id: price_bg
            x: 288
            y: 335
            width: 314
            height: 93
            color: "#ffffff"
            radius: 9

            Text {
                id: element6
                x: 42
                y: 8
                text: qsTr("Flight:")
                lineHeight: 1
                font.pixelSize: 14
            }

            Text {
                id: element7
                x: 42
                y: 31
                height: 17
                text: qsTr("Luggage:")
                font.pixelSize: 14
                lineHeight: 1
            }

            Text {
                id: element8
                x: 100
                y: 68
                text: qsTr("Total:")
                font.pixelSize: 14
                lineHeight: 1
            }

            Text {
                id: flight_price
                x: 87
                y: 10
                text: rev.price
                font.pixelSize: 12
            }

            Text {
                id: luggage_price
                x: 111
                y: 33
                font.pixelSize: 12
                text: rev.luggageNumber * 10
            }

            Text {
                id: total_price
                x: 145
                y: 69
                font.pixelSize: 12
                text: rev.price + rev.luggageNumber * 10
            }
        }

}
