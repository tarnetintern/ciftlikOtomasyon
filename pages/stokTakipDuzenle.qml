import QtQuick                      2.11
import QtQuick.Controls             2.4
import QtQuick.Dialogs              1.3
import QtQuick.Layouts              1.11



import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

Rectangle {
    id: stokTakipDuzenleMainRoot
    color: "#242227"
    width: parent.width
    height: parent.height

    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: stokTakipDuzenleMainRoot.width
    property double defaultHeight: stokTakipDuzenleMainRoot.height

    property int    _defaultFontPixelWidth: 20
    property int    _defaultFontPixelHeight: 10
    property int    largeFontPointSize: 30


    readonly property real _horizontalMargin:   _defaultFontPixelWidth / 2
    readonly property real _verticalMargin:     _defaultFontPixelHeight / 2
    readonly property real _buttonHeight:       ScreenToolsController.isTinyScreen ? _defaultFontPixelHeight * 3 : _defaultFontPixelHeight * 2

    //popupGuncelleme.createObject(kullanicigiris).open()

    GridLayout {
        id:         buttonGrid
        columns: 2
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


        Text {
            id: urunAdi
            text: qsTr("Ürün adı")
            color: "red"
        }
        TextField{
            placeholderText: "Ürünün adını girin"
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

        Button{
            id:onayla
            text:"Düzenle"
            onClicked: onayYazisi.visible=true
        }
        Text {
            id: onayYazisi
            text: qsTr("Ürün Başarıyla Düzenlenmiştir")
            visible:false
        }


    }

    Component.onCompleted: {console.log("degistirilecek id: "+__rightPanel.urunStok)}


}
