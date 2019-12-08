import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

import io.qt.examples 1.0

ApplicationWindow {
    id:searchWindow
    visible: true
    width: 1150
    height: 640
    title: qsTr("Reservation")

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


    Flight{
        id:f3
    }

    ReservationData{
        id:passagner1
    }

    function showSearchResult(){
        if((departure_city.text == f1.departureCity)
                && (arrive_city.text == f1.arriveCity)
                && (traveler_number.currentText<= (f1.capacity-f1.occupancy))) {
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
                 && (traveler_number.currentText<= (f2.capacity-f2.occupancy))){
            flightInfo_bg1.visible = false
            flightInfo_bg2.visible = false

            flightInfo_bg1.visible = true;
            flightID1.text = f2.flightID;
            departure_time1.text = f2.departureTime;
            arrive_time1.text = f2.arriveTime;
            d_city1.text = f2.departureCity;
            a_city1.text = f2.arriveCity;
            price1.text = f2.price;
            if(traveler_number.currentText<= (f3.capacity-f3.occupancy)){
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

    function checkInformation(){
        if(book_firstname.length == 0){
            warning_bg.visible = true
            warning.text= "please enter your first name."
        }else if(book_lastname.length == 0){
            warning_bg.visible = true
            warning.text= "please enter your last name."
        }else if(book_email.length == 0){
            warning_bg.visible = true
            warning.text= "please enter your email."
        }else{
            bookBG.visible = false
            confirm_BG.visible = true
            confirm_gender.text = book_gender.currentText
            confirm_handluggage_number.text = hand_luggage.currentText
            confirm_checkedluggage_number.text = checked_luggage.currentText

            confirm_name.text = book_firstname.text + " " + book_lastname.text
        }

    }



    function setReservationFlightInfo(){
        passagner1.arriveCity = f1.arriveCity
        passagner1.arriveTime = f1.arriveTime
        passagner1.departureCity = f1.departureCity
        passagner1.departureTime = f1.departureTime
        passagner1.flightID = f1.flightID
        passagner1.price = f1.price
    }

    // search page
    Rectangle {
        id: searchBG
        visible: true
//        visible: false

        x: 0
        y: 0
        width: 1158
        height: 653
        color: "#010d24"

        Rectangle {
            id: search_city_bg
            x: 41
            y: 35
            width: 441
            height: 47
            color: "#ffffff"

            Calendar {
                id: calendar
                x: 0
                y: 68
                width: 441
                height: 267
                minimumDate: new Date(2019, 11, 25)
                maximumDate: new Date(2020, 11, 19)
            }

            Button {
                id: search_button
                x: 178
                y: 470
                width: 77
                height: 44
                text: qsTr("Search")
                onClicked: {
                    passagner1.departureCity = departure_city.text
                    passagner1.arriveCity = arrive_city.text
                    showSearchResult();
                }
            }

        }


        TextField {
            id: departure_city
            x: 103
            y: 47
            width: 120
            height: 22
            font.pointSize: 15
            placeholderText: qsTr("departure")
        }

        TextField {
            id: arrive_city
            x: 308
            y: 47
            width: 127
            height: 22
            font.pointSize: 15
            placeholderText: qsTr("arrive")
        }

        Rectangle {
            id: travelers_bg
            x: 41
            y: 398
            width: 441
            height: 38
            color: "#ffffff"

            Text {
                id: element
                x: 19
                y: 10
                width: 62
                height: 18
                text: qsTr("Travelers")
                font.pixelSize: 15
            }

            ComboBox {
                id: traveler_number
                x: 101
                y: 1
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
            x: 518
            y: 35
            width: 609
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
                x: 434
                y: 16
                text: qsTr("price")
                font.pixelSize: 12
            }
        }


        // flightInfo_1
        Rectangle {
            id: flightInfo_bg1
            x: 518
            y: 102
            width: 609
            height: 97
            color: "#ffffff"

            Text {
                id: departure_time1
                x: 14
                y: 27
                width: 91
                height: 22
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 15
//                text: qsTr("d-time")
            }

            Text {
                id: arrive_time1
                x: 140
                y: 27
                width: 87
                height: 22
//                text: f2.capacity
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: element1
                x: 96
                y: 26
                width: 35
                height: 11
                text: qsTr("-->")
                font.bold: false
                font.pixelSize: 16
            }

            Text {
                id: flightID1
                x: 85
                y: 48
//                text: f3.departureCity
                font.pixelSize: 14
            }

            Text {
                id: d_city1
                x: 246
                y: 38
//                text: qsTr("d_city")
                font.pixelSize: 15
            }

            Text {
                id: a_city1
                x: 335
                y: 38
//                text: qsTr("a_city")
                font.pixelSize: 15
            }

            Text {
                id: price1
                x: 433
                y: 38
//                text: qsTr("Price")
                font.bold: true
                font.pixelSize: 15
            }

            Button {
                id: book1
                x: 519
                y: 34
                text: qsTr("Book")
                onClicked: {
                    searchBG.visible=false;
                    bookBG.visible=true;
                    setReservationFlightInfo();
                    confirm_d_city.text = f1.departureCity
                    confirm_a_city.text = f1.arriveCity
                    confirm_departure_time.text = f1.arriveTime
                    confirm_arrive_time.text = f1.arriveTime
                    confirm_price.text = f1.price
                    confirm_flightID.text = f1.flightID


                }
            }



        }

        // flightInfo_2
        Rectangle {
            id: flightInfo_bg2
            visible: false
            x: 518
            y: 205
            width: 609
            height: 97
            color: "#ffffff"

            Text {
                id: departure_time2
                x: 19
                y: 20
                width: 91
                height: 22
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 15
                text: qsTr("d-time")
            }

            Text {
                id: arrive_time2
                x: 144
                y: 20
                width: 87
                height: 22
                text: qsTr("a-time")
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: element2
                x: 94
                y: 19
                width: 35
                height: 11
                text: qsTr("---->")
                font.bold: false
                font.pixelSize: 16
            }

            Text {
                id: flightID2
                x: 85
                y: 48
                text: qsTr("duration")
                font.pixelSize: 14
            }

            Text {
                id: d_city2
                x: 246
                y: 38
                text: qsTr("d_city")
                font.pixelSize: 15
            }

            Text {
                id: a_city2
                x: 335
                y: 38
                text: qsTr("a_city")
                font.pixelSize: 15
            }

            Text {
                id: price2
                x: 433
                y: 38
                text: qsTr("Price")
                font.bold: true
                font.pixelSize: 15
            }

            Button {
                id: book2
                x: 519
                y: 34
                text: qsTr("Book")
                onClicked: {
                    searchBG.visible=false;
                    bookBG.visible=true;
                }
            }

        }



    }

    //book page
    Rectangle {
        id: bookBG
        visible: false
        x: 0
        y: 0
        width: 1150
        height: 640
        color: "#010d24"

        Rectangle {
            id: rectangle
            x: 292
            y: 318
            width: 566
            height: 50
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
                    ListElement{key:"2";value:"false"}
                    ListElement{key:"3";value:"false"}
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



        Button {
            id: book_confirm
            x: 534
            y: 513
            text: qsTr("Confirm")
            onClicked: {
                flight_price.text = passagner1.price
                luggage_price.text = hand_luggage.currentIndex *100 + checked_luggage.currentText *200
                total_price.text = passagner1.price + hand_luggage.currentIndex *100 + checked_luggage.currentText *200
                checkInformation();
            }
        }



        Rectangle {
            id: passagner_info
            x: 292
            y: 141
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

        Rectangle {
            id: class_bg
            visible: false
            x: 292
            y: 428
            width: 566
            height: 38
            color: "#75dbe3ec"

            CheckBox {
                id: checkBox1
                x: 154
                y: 7
                text: qsTr("Economic Class")
            }

            CheckBox {
                id: checkBox
                x: 16
                y: 7
                text: qsTr("Business Class")
            }

            Text {
                id: luggage1
                x: 0
                y: -25
                color: "#f1f0f0"
                text: qsTr("Saet")
                font.bold: true
                font.pixelSize: 16
            }

        }

        Rectangle {
            id: warning_bg
            visible: false
            x: 374
            y: 453
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
                bookBG.visible  = false
                searchBG.visible = true
            }
        }

    }

    // confirm page
    Rectangle {
        id: confirm_BG
        visible: false
//        visible: true

        x: 0
        y: 0
        width: 1150
        height: 640
        color: "#010d24"


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
                confirm_BG.visible = false
                bookBG.visible  = true
            }
        }


        Rectangle {
            id: confirm_flightInfo_bg
            x: 281
            y: 154
            width: 589
            height: 97
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
//                text: qsTr("d-time")
            }

            Text {
                id: confirm_arrive_time
                x: 140
                y: 27
                width: 87
                height: 22
//                text: f2.capacity
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

//            Text {
//                id: confirm_flightID
//                x: 85
//                y: 48
//                font.pixelSize: 14
//            }

            Text {
                id: confirm_d_city
                x: 246
                y: 38
//                text: qsTr("d_city")
                font.pixelSize: 15
            }

            Text {
                id: confirm_a_city
                x: 335
                y: 38
//                text: qsTr("a_city")
                font.pixelSize: 15
            }

            Text {
                id: confirm_price
                x: 433
                y: 38
                //                text: qsTr("Price")
                font.bold: true
                font.pixelSize: 15
            }

            Text {
                id: confirm_flightID
                x: 91
                y: 60
                font.pixelSize: 12
            }




        }



        //passagner info
        Rectangle {
            id: confirm_passagner_info
            x: 281
            y: 286
            width: 288
            height: 92
            color: "#75dbe3ec"



            Text {
                id: confirm_gender
                x: 70
                y: 39
                color: "#ece5e5"
                text: qsTr("Gender")
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
                text: qsTr("Email@mail")
                font.pixelSize: 13
            }

            Text {
                id: confirm_name
                x: 70
                y: 12
                width: 114
                height: 15
                color: "#fdfdfd"
                text: qsTr("")
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
            x: 599
            y: 286
            width: 271
            height: 92
            color: "#75dbe3ec"

            Text {
                id: confirm_luggage
                x: 0
                y: -25
                color: "#f1f0f0"
                text: qsTr("Luggage")
                font.bold: true
                font.pixelSize: 16
            }



            Text {
                id: confirm_handLuggage
                x: 13
                y: 15
                color: "#dad4d4"
                text: qsTr("Hand Luggage")
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
                text: qsTr("number of hand luggage")
                font.pixelSize: 13
            }

            Text {
                id: confirm_checkedluggage_number
                x: 137
                y: 54
                color: "#fdfdfd"
                text: qsTr("number checked luggage")
                font.pixelSize: 13
            }

        }

        Button {
            id: payment
            x: 531
            y: 526
            text: qsTr("payment")
        }

        Rectangle {
            id: price_bg
            x: 419
            y: 408
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
                font.pixelSize: 12
            }

            Text {
                id: luggage_price
                x: 111
                y: 33
                font.pixelSize: 12
            }

            Text {
                id: total_price
                x: 145
                y: 69
                font.pixelSize: 12
            }
        }

    }

}
