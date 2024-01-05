import QtQuick 2.15
import COtomasyon.evControl 1.0

import QtQuick.Controls             2.4
import QtQuick.Dialogs              1.3
import QtQuick.Layouts              1.11
import QtQuick.Window 2.15
import COtomasyon.ScreenToolsController 1.0

import COtomasyon.Ayarlar 1.0

Item {
    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: mainWindow.width
    property double defaultHeight: mainWindow.height
    property bool tinyScreen : Screen.desktopAvailableWidth < 700
    property var verilerListesi:Ayarlar.ayarlarSayfasiVerileriGetir()
    property bool verilerListesiHazir:verilerListesi.length>0

    property string apiUrl: verilerListesiHazir ? verilerListesi[0]:""
    property string username: verilerListesiHazir ? verilerListesi[1]:""
    property string password: verilerListesiHazir ? verilerListesi[2]:""

    property int    defaultFontPixelWidth: tinyScreen ? 10:20
    property int    defaultFontPixelHeight: tinyScreen ? 5:10
    property int    largeFontPointSize: 30

    ListModel {
        id: lightsModel

        ListElement { name: "Isiklar 1" }
        ListElement { name: "Isiklar 2" }
        ListElement { name: "Isiklar 3" }
        ListElement { name: "Isiklar 4" }
        ListElement { name: "Alarm 1" }
        ListElement { name: "Alarm 2" }
        ListElement { name: "Role 1" }
        ListElement { name: "Role 2" }
        ListElement { name: "Role 3" }
        // Daha fazla ışık eklemek isterseniz ListElement ekleyebilirsiniz
    }

    ScrollView {
        anchors.fill: parent
        anchors.centerIn: parent
        clip: true


        GridLayout {
            id: gridLayout
            columns: 1
            columnSpacing: defaultFontPixelWidth
            rowSpacing: defaultSpacing

            Repeater {
                model: lightsModel

                Item {
                    width: gridLayout.width
                    height: childrenRect.height

                    GridLayout {
                        columns: 4
                        columnSpacing: defaultFontPixelWidth
                        rowSpacing: defaultSpacing

                        Text {
                            color: "#3cd731"
                            text: model.name
                            font.bold: true
                            font.pointSize: 12
                        }

                        Button {
                            text: "aç"
                            onClicked: {
                                var url = apiUrl+"webhook";
                                var json = JSON.stringify({ [model.name]: "1" });
                                //EvControl.postData(url, json)
                                EvControl.postDataAuth(url,json,username,password)
                            }
                        }

                        Button {
                            text: "kapat"
                            onClicked: {
                                var url = apiUrl+"webhook";
                                var json = JSON.stringify({ [model.name]: "0" });
                                //EvControl.postData(url, json)
                                EvControl.postDataAuth(url,json,username,password)
                            }
                        }

                        Text {
                            id: sonucYazisi
                            color: "#3cd731"
                            text: qsTr("Sonuç Yazısı")
                            font.bold: true
                            font.pointSize: 12
                        }
                    }

                    Connections {
                        target: EvControl
                        onApiResponseReceived: {
                            if (statusCode===200) {
                                //console.log(JSON.parse(response)["data"][model.name])
                                if (JSON.parse(response)["data"][model.name] === "1")
                                    sonucYazisi.text = "Açık"
                                else if (JSON.parse(response)["data"][model.name] === "0")
                                    sonucYazisi.text = "Kapalı"
                            }
                        }
                        onApiResponseReceivedGet: {
                            //console.log(response)

                            if (statusCode===200) {
                                if (JSON.parse(response)[model.name] === "1")
                                    sonucYazisi.text = "Açık"
                                else if (JSON.parse(response)[model.name] === "0")
                                    sonucYazisi.text = "Kapalı"
                            }

                        }


                    }
                }
            }
        }
    }


    focus: true  // Odağı etkinleştirir

//    Keys.onBackPressed: {
//        console.log("Geri tuşuna basıldı");
//        // Geri tuşuna basıldığında yapılacak işlemler
//    }

    Component.onCompleted: {
        var url = apiUrl+"todo";
        EvControl.performGetRequest(url,username,password)

    }

}

