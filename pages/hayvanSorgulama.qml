import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4


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
    property var hayvanGoruntulemeListesi

    property bool ilkAcilisVisible: false
    property bool veriEklemeBasariliMi: false
    property bool duzenlemeAktifMi: false

    property int olum_tarihiV_sayi: 0
    property int dogum_tarihiV_sayi: 0



    Rectangle{
        id: rectangle
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "grey"



        TextField{
            id:kupeNo

            anchors.leftMargin: 5

            width: parent.width/4
            height: 41

            onTextChanged: {
                filterModel();

            }

        }

        Repeater{
            id:kupeNoRepeater
            model:11
            anchors.top: kupeNo.bottom
            Layout.maximumWidth: kupeNo.width

            delegate: Button{
                id:buttonKu
                anchors.top: kupeNo.bottom
                anchors.topMargin: 10
                text: index !== 10 ? index:"sil"
                width: 30
                height: 30
                x:0+(index*(buttonKu.width+3))
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



        Rectangle{
            Layout.maximumWidth: hayvanSorgulamaRoot-(hayvanSorgulamaRoot/3)
            height: hayvanSorgulamaRoot.height
            anchors.left: kupeNo.right
            anchors.leftMargin: 5

            Item {
                id: hayvanGoruntuleme

                GridLayout{
                    columns: 2
                    columnSpacing: largeFontPointSize


                    Text {
                        id: hayvan_turu
                        text: qsTr("Hayvan Türü")
                        font.pointSize: 24

                    }

                    ComboBox{
                        id:hayvan_turuV
                        model: ["İnek", "Koyun","..."]
                        enabled: duzenlemeAktifMi

                    }

                    Text {
                        id: hayvan_adi
                        text: qsTr("Hayvan Adi")
                        font.pointSize: 24

                    }

                    TextField{
                        id:hayvan_adiV
                        enabled: duzenlemeAktifMi


                    }

                    Text {
                        id:kupe_no
                        text: qsTr("Kupe No")
                        font.pointSize: 24

                    }

                    TextField{
                        id:kupe_noV
                        enabled: duzenlemeAktifMi


                    }

                    Text {
                        id:dogum_tarihi
                        text: qsTr("Doğum Tarihi")
                        font.pointSize: 24

                    }

                    TextField{
                        id:dogum_tarihiV
                        enabled: duzenlemeAktifMi



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
                        enabled: duzenlemeAktifMi


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
                        enabled: duzenlemeAktifMi


                    }

                    Text {
                        id:anne_kupe_no
                        text: qsTr("Anne Kupe No")
                        font.pointSize: 24

                    }

                    TextField{
                        id:anne_kupe_noV
                        enabled: duzenlemeAktifMi


                    }

                    Text {
                        id:baba_kupe_no
                        text: qsTr("Baba Küpe No")
                        font.pointSize: 24

                    }

                    TextField{
                        id:baba_kupe_noV
                        enabled: duzenlemeAktifMi


                    }
                    Button{
                        id:duzenlemeButton
                        text:"Düzenle"
                        enabled: hayvan_adiV.length>0

                        onClicked: duzenlemeAktifMi=true
                    }

                    Button{
                        id:eklemeButton
                        text: "Ekle"
                        Layout.fillWidth:true
                        visible: duzenlemeAktifMi
                        enabled: duzenlemeAktifMi

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
            kayitliHayvanlarListesi=DataBase.veriTabaniSorgulamaYap("")[0]
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
        y:kupeNo.height+30+30
        x:0



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
                    width: listView.width-(listView.width/100)*3
                    height: 30
                    radius: 50
                    //                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    color: index%2==0 ? "#7e1616":"#7e2916"
                    border.color: Qt.darker(color)
                    visible: visibleV

                    Text {
                        anchors.centerIn: parent
                        text: "Kupe No: "+value
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                        onClicked: {
                            hayvanGoruntulemeListesi=DataBase.veriTabaniSorgulamaYap(value)

                            //hayvan_turuV
                            hayvan_turuV.currentIndex=hayvanGoruntulemeListesi[0]==="İnek" ? 0:1
                            hayvan_adiV.text=hayvanGoruntulemeListesi[1]
                            kupe_noV.text=hayvanGoruntulemeListesi[2]
                            dogum_tarihiV.text=hayvanGoruntulemeListesi[3]
                            olum_tarihiV.text=hayvanGoruntulemeListesi[4]
                            yavru_sayisiV.text=hayvanGoruntulemeListesi[5]
                            anne_kupe_noV.text=hayvanGoruntulemeListesi[6]
                            baba_kupe_noV.text=hayvanGoruntulemeListesi[7]

                        }
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
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/

