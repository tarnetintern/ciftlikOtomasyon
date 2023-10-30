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
                       placeholderText: "Kategoriyi Yazınız"


                   }
                   Button{
                       text: "EKLE"
                       onClicked: eklemeBasariliMi=true
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
            Layout.fillWidth: parent

            model: ["..."]
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
            placeholderText: "Ürünün adını girin"
        }
        Text {
            id: urunAdiKontrol
            text: qsTr("-")
            color: "red"
            Layout.fillWidth: parent


        }
        Text {
            id: stokAdet
            text: qsTr("Stok Adet")
            color: "red"
        }
        TextField{
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
            onClicked: onayYazisi.visible=true
        }
        Text {
            id: onayYazisi
            text: qsTr("Ürün Başarıyla Eklenmiştir")
            visible:false
        }


    }


}
