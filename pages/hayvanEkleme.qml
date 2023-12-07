import QtQuick 2.11
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3

import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

Item {
    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: mainWindow.width
    property double defaultHeight: mainWindow.height
    property bool tinyScreen : Screen.desktopAvailableWidth < 700

    property int    defaultFontPixelWidth: 20
    property int    defaultFontPixelHeight: 10
    property int    largeFontPointSize: 30

    property bool veriEklemeBasariliMi: false
    property bool ilkAcilisVisible: false

    property int olum_tarihiV_sayi: 0
    property int dogum_tarihiV_sayi: 0

    GridLayout{
        columns: 2
        columnSpacing: largeFontPointSize
        anchors.centerIn: parent

        Text {
            id: hayvan_turu
            text: qsTr("Hayvan Türü")
            font.pointSize: 24

        }

        ComboBox{
            id:hayvan_turuV
            model: ["İnek","Koyun", "..."]

        }

        Text {
            id: hayvan_adi
            text: qsTr("Hayvan Adi")
            font.pointSize: 24

        }

        TextField{
            id:hayvan_adiV
            text: "ayse"

        }

        Text {
            id:kupe_no
            text: qsTr("Kupe No")
            font.pointSize: 24

        }

        TextField{
            id:kupe_noV
            text: "123456"

        }

        Text {
            id:dogum_tarihi
            text: qsTr("Doğum Tarihi")
            font.pointSize: 24

        }

        TextField{
            id:dogum_tarihiV
            text: "12-12-2000"


            onTextChanged:{
                if(dogum_tarihiV_sayi>length){
                    text=""
                    dogum_tarihiV_sayi=0
                }
                else if((length===2) || (length===5) ){
                    text=text+"-"
                }
                dogum_tarihiV_sayi=length
            }


        }

        Text {
            id:olum_tarihi
            text: qsTr("Ölüm Tarihi")
            font.pointSize: 24

        }

        TextField{
            id:olum_tarihiV
            text: "12-12-2001"

            onTextChanged:{
                //dogum_tarihiV_sayi
                if(olum_tarihiV_sayi>length){
                    text=""
                    olum_tarihiV_sayi=0
                }
                else if((length===2) || (length===5) ){
                    text=text+"-"
                }
                olum_tarihiV_sayi=length
            }

        }

        Text {
            id:yavru_sayisi
            text: qsTr("Yavru sayisi")
            font.pointSize: 24

        }

        TextField{
            id:yavru_sayisiV
            text: "1"

        }

        Text {
            id:anne_kupe_no
            text: qsTr("Anne Kupe No")
            font.pointSize: 24

        }

        TextField{
            id:anne_kupe_noV
            text: "1111"

        }

        Text {
            id:baba_kupe_no
            text: qsTr("Baba Küpe No")
            font.pointSize: 24

        }

        TextField{
            id:baba_kupe_noV
            text: "3333"

        }

        Button{
            id:eklemeButton
            text: "Ekle"
            Layout.fillWidth:true

            onClicked: {
                veriEklemeBasariliMi=DataBase.veriTabaniKayitEkle(hayvan_turuV.currentText,
                                                                  hayvan_adiV.text,
                                                                  kupe_noV.text,
                                                                  dogum_tarihiV.text,
                                                                  olum_tarihiV.text,
                                                                  parseInt(yavru_sayisiV.text),
                                                                  anne_kupe_noV.text,
                                                                  baba_kupe_noV.text)
                console.log("veri ekleme basarili mi:"+veriEklemeBasariliMi)
                ilkAcilisVisible=true
            }

        }

        Text {
            id: veriEklemeOnayYazisi
            text: veriEklemeBasariliMi ? qsTr("Kayıt Başarıyla eklendi"):qsTr("Kayıt Eklenirken Hata Oluştu")
            font.bold: true
            font.pointSize: 14
            color: veriEklemeBasariliMi ? "green":"red"
            visible: ilkAcilisVisible

        }


    }




    Component.onCompleted: {


    }






}



