import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick 2.0

import io.qt.examples 1.0

ApplicationWindow {
    id: logWindow
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    width: 640
    height: 480
    title: qsTr("Log in")
    color:"#c1d5f5"


    Operator{
        id:mOperator
        userName: "1"
        passWord: "1"
    }


    Text {
        id: element
        x: 195
        y: 171
        text: qsTr("User Name：")
        font.pixelSize: 16
    }

    Text {
        id: element1
        x: 195
        y: 208
        text: qsTr("Password：")
        font.pixelSize: 16
    }

    Rectangle {
        id: button_bg
        x: 268
        y: 256
        width: 104
        height: 44
        color: "#dde8ea"
    }


    TextField {
        id: username
        x: 298
        y: 171
        width: 140
        height: 22
        placeholderText: qsTr("user name")
    }

    TextField {
        id: password
        x: 298
        y: 208
        width: 140
        height: 22
        echoMode: 2
        placeholderText: qsTr("password")
    }

    Button{
        id:login
        text: "Log In"
        anchors.fill: button_bg

        Loader{ id: pageLoader }

        onClicked: {
            // check username&password, jump to search page
            checkInfo();
        }

    }

    function checkInfo(){
        if( username.text == mOperator.userName && password.text == mOperator.passWord){
            logWindow.close()
            // load search page
            pageLoader.source = "" // Clearing first
            pageLoader.source = "search.qml"
        }
    }


}
