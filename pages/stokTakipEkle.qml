import QtQuick                      2.11
import QtQuick.Controls             2.4
import QtQuick.Dialogs              1.3
import QtQuick.Layouts              1.11



import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

Rectangle {
    id: stokTakipEkleMainRoot
    color: "#242227"
    width: parent.width
    height: parent.height

    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: stokTakipEkleMainRoot.width
    property double defaultHeight: stokTakipEkleMainRoot.height

    property int    _defaultFontPixelWidth: 20
    property int    _defaultFontPixelHeight: 10
    property int    largeFontPointSize: 30


    readonly property real _horizontalMargin:   _defaultFontPixelWidth / 2
    readonly property real _verticalMargin:     _defaultFontPixelHeight / 2
    readonly property real _buttonHeight:       ScreenToolsController.isTinyScreen ? _defaultFontPixelHeight * 3 : _defaultFontPixelHeight * 2


    property var kategorilerModel:[]
    property var donenListe:[]

    //popupGuncelleme.createObject(kullanicigiris).open()
    Component {
        id: popupGuncelleme

        COPopupDialog {
            id:         deneme
            title:      qsTr("Yeni Kategori Ekle")
            buttons:    StandardButton.Close
            property bool eklemeBasariliMi: false
            ColumnLayout{
                spacing:    _verticalMargin

                Text {
                    text:  "Eklemek istediğiniz kategoriyi giriniz"
                    font.pixelSize: 24
                    color: "red"
                }
                TextField{
                    id:kategoriAdi
                    placeholderText: "Kategoriyi Yazınız"


                }
                Button{
                    text: "EKLE"
                    onClicked: {
                        eklemeBasariliMi=DataBase.veriTabaniKayitEkleKategoriler(kategoriAdi.text)
                        if(eklemeBasariliMi){
                            kategorilerModel = []
                            donenListe=DataBase.veriTabaniKayitSorgulaKategoriler()
                            for (var i = 0; i < donenListe.length; ++i) {
                                kategorilerModel.push(donenListe[i]);
                            }

                            kategoriGrubuComboBox.model=kategorilerModel
                        }

                    }
                }
                Text {
                    text: eklemeBasariliMi ? "Başarılı":"Başarısız"
                    font.pixelSize: 24
                    color: eklemeBasariliMi ? "green":"red"
                }

            }



        }

    }

    GridLayout {
        id:         buttonGrid
        columns: 3
        columnSpacing: _verticalMargin


        Text {
            id: kategoriGrubu
            text: qsTr("Kategori")
            color: "red"
        }
        ComboBox{
            id: kategoriGrubuComboBox
            Layout.fillWidth: parent

            model: ["..."]

            onCurrentIndexChanged: {
                urunAdiTextField.text=""
                skuAdiTextField.text=""
                stockAdetTextField.text=""
                urunAdiKontrol.text="-"
                skuAdiKontrol.text="-"
                stokAdetKontrol.text="+"
                onayYazisi.visible=false
            }
        }
        Button{
            text:"YENİ"
            onClicked: popupGuncelleme.createObject(stokTakipEkleMainRoot).open()
        }

        Text {
            id: urunAdi
            text: qsTr("Ürün adı")
            color: "red"
        }
        TextField{
            id:urunAdiTextField
            placeholderText: "Ürünün adını girin"
        }
        Text {
            //bu sistem anlık olarak text degistiginde veri tabanından sorgulama yapar ve uygunluk
            //kontrol edilmesi saglanir
            id: urunAdiKontrol
            text: qsTr("-")
            color: "red"
            Layout.fillWidth: parent


        }
        //
        Text {
            id: skuAdi
            text: qsTr("SKU adı")
            color: "red"
        }
        TextField{
            id:skuAdiTextField
            placeholderText: "SKU Kodunu girin"
        }
        Text {
            //bu sistem anlık olarak text degistiginde veri tabanından sorgulama yapar ve uygunluk
            //kontrol edilmesi saglanir
            id: skuAdiKontrol
            text: qsTr("-")
            color: "red"
            Layout.fillWidth: parent


        }
        //
        Text {
            id: stokAdet
            text: qsTr("Stok Adet")
            color: "red"
        }
        TextField{
            id:stockAdetTextField
            placeholderText: "Ürünün başlangıç stoğunu girin"
            validator: IntValidator {bottom: 0; top: 1000000}
        }
        Text {
            id: stokAdetKontrol
            text: qsTr("+")
            color: "green"
        }
        Button{
            id:onayla
            text:"EKLE"
            onClicked: {
//                var currentDate = new Date();
                if(DataBase.veriTabaniKayitEkleStok(kategoriGrubuComboBox.currentText,urunAdiTextField.text,skuAdiTextField.text,/*currentDate,*/stockAdetTextField.text)){
                    onayYazisi.visible=true
                }else{
                    redYazisi.visible=true
                }

            }
        }
        Text {
            id: onayYazisi
            color: "#48e40f"
            text: qsTr("Ürün Başarıyla Eklenmiştir")
            font.bold: true
            font.pointSize: 12
            visible:false
        }
        Text {
            id: redYazisi
            color: "#ff0004"
            text: qsTr("Ürün Eklenirken Hata Olmuştur")
            font.bold: true
            font.pointSize: 12
            visible:false
        }
    }

    Component.onCompleted: {
        kategorilerModel = []
        donenListe=DataBase.veriTabaniKayitSorgulaKategoriler()
        for (var i = 0; i < donenListe.length; ++i) {
            kategorilerModel.push(donenListe[i]);
        }

        kategoriGrubuComboBox.model=kategorilerModel

    }


}
