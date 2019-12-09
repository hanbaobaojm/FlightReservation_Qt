import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

//import io.qt.examples 1.0

ApplicationWindow {
    id:searchWindow
    visible: true
    width: 973
    height: 455
    title: qsTr("Search")

    Connections{
        target: f1
        onDemoSignal:{
            demoText.text = "Demo handled"
        }
    }
    Connections{
        target: f2
        onDemoSignal:{
            demoText.text = "Demo handled"
        }
    }
    Connections{
        target: f3
        onDemoSignal:{
            demoText.text = "Demo handled"
        }
    }

    Reservation{
        id:rev
    }

    function showSearchResult(){
        if((departure_city.text == f1.departureCity)
                && (arrive_city.text == f1.arriveCity)
                && (traveler_number.currentText<= (f1.occupancy))) {
            flightInfo_bg1.visible = false
            flightInfo_bg2.visible = false

            flightInfo_bg1.visible = true;
            flightID1.text = f1.flightID;
            departure_time1.text = f1.departureTime;
            arrive_time1.text = f1.arriveTime;
            d_city1.text = f1.departureCity;
            a_city1.text = f1.arriveCity;
            price1.text = f1.price;
        }else if((departure_city.text == f2.departureCity)
                 && (arrive_city.text == f2.arriveCity)
                 && (traveler_number.currentText<= (f2.occupancy))){
            flightInfo_bg1.visible = false
            flightInfo_bg2.visible = false

            flightInfo_bg1.visible = true;
            flightID1.text = f2.flightID;
            departure_time1.text = f2.departureTime;
            arrive_time1.text = f2.arriveTime;
            d_city1.text = f2.departureCity;
            a_city1.text = f2.arriveCity;
            price1.text = f2.price;
            if(traveler_number.currentText<= (f3.occupancy)){
                flightInfo_bg2.visible = true
                flightID2.text = f3.flightID;
                departure_time2.text = f3.departureTime;
                arrive_time2.text = f3.arriveTime;
                d_city2.text = f3.departureCity;
                a_city2.text = f3.arriveCity;
                price2.text = f3.price;
            }

        }
    }




    Rectangle {
        id: searchBG
        visible: true
//        visible: false

        x: 0
        y: 0
        width: 973
        height: 455
        color: "#010d24"

        Rectangle {
            id: search_city_bg
            x: 41
            y: 35
            width: 356
            height: 47
            color: "#ffffff"
            TextField {
                id: departure_city
                x: 22
                y: 17
                width: 120
                height: 22
                font.pointSize: 15
                placeholderText: qsTr("departure")
            }

            TextField {
                id: arrive_city
                x: 211
                y: 17
                width: 127
                height: 22
                font.pointSize: 15
                placeholderText: qsTr("arrive")
            }
        }
        Calendar {
            id: calendar
            x: 41
            y: 102
            width: 356
            height: 195
            minimumDate: new Date(2019, 11, 25)
            maximumDate: new Date(2020, 11, 19)
        }

        Button {
            id: search_button
            x: 181
            y: 372
            width: 77
            height: 44
            text: qsTr("Search")
            onClicked: {
                rev.departureCity = departure_city.text
                rev.arriveCity = arrive_city.text
                showSearchResult();
            }
        }




        Rectangle {
            id: travelers_bg
            x: 41
            y: 320
            width: 356
            height: 32
            color: "#ffffff"

            Text {
                id: element
                x: 23
                y: 5
                width: 62
                height: 18
                text: qsTr("Travelers")
                font.pixelSize: 15
            }

            ComboBox {
                id: traveler_number
                x: 153
                y: 3
                textRole:"traveler"
                model:
                    ListModel{
                    id:listmodel
                    ListElement{traveler:"1";value:"true"}
                    ListElement{traveler:"2";value:"false"}
                    ListElement{traveler:"3";value:"false"}
                    ListElement{traveler:"4";value:"false"}
                    ListElement{traveler:"5";value:"false"}
                }

            }
        }





        // search result head
        Rectangle {
            id: head_bg
            x: 436
            y: 35
            width: 509
            height: 47
            color: "#ffffff"

            Text {
                x: 8
                y: 16
                text: qsTr("departure time")
                font.pixelSize: 12
            }

            Text {
                x: 135
                y: 16
                text: qsTr("arrive time")
                font.pixelSize: 12
            }

            Text {
                x: 225
                y: 16
                text: qsTr("departure city")
                font.pixelSize: 12
            }

            Text {
                x: 325
                y: 16
                text: qsTr("arrive city")
                font.pixelSize: 12
            }

            Text {
                id: element9
                x: 435
                y: 16
                text: qsTr("price")
                font.pixelSize: 12
            }
        }


        // flightInfo_1
        Rectangle {
            id: flightInfo_bg1
            x: 436
            y: 102
            width: 509
            height: 90
            visible: false
            color: "#ffffff"

            Text {
                id: departure_time1
                x: 8
                y: 16
                width: 90
                height: 22
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 15
//                text: qsTr("d-time")
            }

            Text {
                id: arrive_time1
                x: 135
                y: 16
                width: 90
                height: 22
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: element1
                x: 96
                y: 16
                width: 35
                height: 11
                text: qsTr("-->")
                font.bold: false
                font.pixelSize: 16
            }

            Text {
                id: flightID1
                x: 85
                y: 50
                font.pixelSize: 14
            }

            Text {
                id: d_city1
                x: 225
                y: 50
                font.pixelSize: 15
            }

            Text {
                id: a_city1
                x: 325
                y: 50
                font.pixelSize: 15
            }

            Text {
                id: price1
                x: 435
                y: 50
                font.bold: true
                font.pixelSize: 15
            }

            Button {
                id: book1
                x: 435
                y: 16
                width: 60
                height: 20
                text: qsTr("Book")
                onClicked: {
                    rev.setArriveCity(a_city1.text)
                    rev.setDepartureCity(d_city1.text)
                    rev.setArriveTime(arrive_time1.text)
                    rev.setDepartureTime(departure_time1.text)
                    rev.setPrice(price1.text)
                    rev.setFlightID(flightID1.text)
                    searchWindow.visible = false
                    bookWindow.visible = true
                    //searchWindow.close()
                    //pageLoader.source = "" // Clearing first
                    //pageLoader.source = "book.qml"

                }
            }



        }

        // flightInfo_2
        Rectangle {
            id: flightInfo_bg2
            visible: false
            x: 436
            y: 220
            width: 509
            height: 90
            color: "#ffffff"

            Text {
                id: departure_time2
                x: 8
                y: 16
                width: 91
                height: 22
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 15
                text: qsTr("d-time")
            }

            Text {
                id: arrive_time2
                x: 135
                y: 16
                width: 87
                height: 22
                text: qsTr("a-time")
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: element2
                x: 96
                y: 16
                width: 35
                height: 11
                text: qsTr("-->")
                font.bold: false
                font.pixelSize: 16
            }

            Text {
                id: flightID2
                x: 85
                y: 50
                text: qsTr("duration")
                font.pixelSize: 14
            }

            Text {
                id: d_city2
                x: 225
                y: 50
                text: qsTr("d_city")
                font.pixelSize: 15
            }

            Text {
                id: a_city2
                x: 325
                y: 50
                text: qsTr("a_city")
                font.pixelSize: 15
            }

            Text {
                id: price2
                x: 435
                y: 50
                text: qsTr("Price")
                font.bold: true
                font.pixelSize: 15
            }

            Button {
                id: book2
                x: 435
                y: 16
                width: 60
                height: 20
                text: qsTr("Book")
                    onClicked: {
                        rev.setArriveCity(a_city2.text)
                        rev.setDepartureCity(d_city2.text)
                        rev.setArriveTime(arrive_time2.text)
                        rev.setDepartureTime(departure_time2.text)
                        rev.setPrice(price2.text)
                        rev.setFlightID(flightID2.text)
                        searchWindow.visible = false
                        bookWindow.visible = true
                        //searchWindow.close()
                        // load search page
                        //pageLoader.source = "" // Clearing first
                        //pageLoader.source = "book.qml"

                    }
            }

        }

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
        id: bookWindow
        visible: false
        width: 973
        height: 480
        color:"#010d24"




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
                        ListElement{gender:"Male";value:"true"}
                        ListElement{gender:"Female";value:"false"}
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
                        bookWindow.visible=false
                        confirmWindow.visible=true
                        //element5.text = rev.passengerName
                    //bookWindow.close()
                    //pageLoader.source = "" // Clearing first
                    //pageLoader.source = "confirm.qml"
                        //window.pageStack.push(confirmWindow, {rev}, true)
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
                    bookWindow.visible=false
                    searchWindow.visibility=true
                    //bookWindow.close()
                    //pageLoader.source = "" // Clearing first
                    //pageLoader.source = "search.qml"
                }
            }

    }

    Rectangle {
        id: confirmWindow
        visible: false
        width: 973
        height: 480
        color:"#010d24"
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
                    confirmWindow.visible=false
                    bookWindow.visible=true
                    //confirmWindow.close()
                    //pageLoader.source = "" // Clearing first
                    //pageLoader.source = "book.qml"
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
                    x: 111
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
}
