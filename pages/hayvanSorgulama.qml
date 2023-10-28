import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3

import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

Item{
    id:hayvanSorgulamaRoot
    property string hayvanResimleriPath: "/hayvanGorselleri/inek2.png"

    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: mainWindow.width
    property double defaultHeight: mainWindow.height

    property int    defaultFontPixelWidth: 20
    property int    defaultFontPixelHeight: 10
    property int    largeFontPointSize: 30

    property var kayitliHayvanlarListesi

    Rectangle{
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "grey"


        Image {
            id: hayvan
            y: 166
            source: hayvanResimleriPath
            anchors.leftMargin: 8
            width: Screen.desktopAvailableWidth/7
            height: Screen.desktopAvailableHeight/7
            anchors.centerIn: parent.Center
            anchors.left: parent.left
        }

        TextField{
            id:kupeNo
            anchors.left: hayvan.right
            anchors.leftMargin: -1
            x:400
            y: 69
            width: parent.width-hayvan.width-30
            height: 41

            onTextChanged: {
                filterModel();




            }



        }

        Repeater{
            id:kupeNoRepeater
            model:11
            anchors.top: kupeNo.bottom

            delegate: Button{
                id:buttonKu
                anchors.top: kupeNo.bottom
                text: index !== 10 ? index:"sil"
                width: 50
                height: 50
                x:300+(index*(buttonKu.width+10))
                onClicked: {
                    if(index!==10){
                        kupeNo.text+=index
                    }
                    else{
                        kupeNo.text = kupeNo.text.slice(0, -1); // Son karakteri sil
                    }

                }

            }
        }


    }


    function filterModel() {
        hayvanlarmodeliDegisen.clear()
        for (var i = 0; i < hayvanlarmodeli.count; i++) {
            if (hayvanlarmodeli.get(i).value.includes((kupeNo.text))) {
                hayvanlarmodeli.get(i).visibleV = true;
                hayvanlarmodeliDegisen.append(hayvanlarmodeli.get(i))
            } else {
                hayvanlarmodeli.get(i).visibleV = false;
            }
        }

    }


    ListModel {
        id:hayvanlarmodeli
        Component.onCompleted: {
            kayitliHayvanlarListesi=DataBase.veriTabaniSorgulamaYap("")
            for (var i = 0; i < kayitliHayvanlarListesi.length; ++i) {
                append({value: kayitliHayvanlarListesi[i],visibleV:false});
            }
        }
    }

    ListModel {
        id:hayvanlarmodeliDegisen

    }

    Rectangle {

        id: rootw
        width: kupeNo.width
        height: kupeNo.height*10
        color: "#403F41"
        y:200
        x:200


        Label {
            id:aktifgorevtext
            text:       {qsTr("Hayvanlar")}
            x:(parent.width/100)*17
            y:(parent.height/100)*5
        }

        ListView {
            x:(parent.width/100)*3
            y:(parent.height/100)*15
            id: listView
            width: parent.width-(parent.width/100)*3
            height: rootw.height-(rootw.height/2)
            spacing: 15
            clip : false

            model: hayvanlarmodeliDegisen

            delegate: Item {
                id: delegateItem
                width: listView.width
                height: 50

                Rectangle {
                    id: dragRect
                    width: listView.width/3
                    height: 30
                    radius: 50
                    //                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#7e1616"
                    border.color: Qt.darker(color)
                    visible: {
                        console.log("visible rect: "+visibleV)
                        return visibleV}

                    Text {
                        anchors.centerIn: parent
                        text: "Kupe No: "+value
                    }
                }
            }

        }
    }

    Component.onCompleted: {
        console.log("yuklendi")
        console.log("Veri tabanı olusturma: "+DataBase.veriTabaniniOlustur("local","deneme3","batuhan","admin"))
        console.log("Tabloları olusturma: "+DataBase.tablolariOlustur())


    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

