import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0
import QtQuick.Dialogs              1.3



//https://stackoverflow.com/questions/43273240/how-to-make-a-cell-editable-in-qt-tableview

import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0


TableView {
    id: tableView
    objectName: "tableView"
    horizontalScrollBarPolicy: -1
    selectionMode: SelectionMode.SingleSelection
    anchors.fill: parent

    TableViewColumn {
        id: urunStokId
        title: "Stok Numarası"
        role: "urunStokId"
        movable: false
        resizable: true
        //width: tableView.viewport.width - authorColumn.width
    }

    TableViewColumn {
        id: kategori
        title: "Kategori"
        role: "kategori"
        movable: false
        resizable: true
        //width: tableView.viewport.width - authorColumn.width
    }

    TableViewColumn {
        id: urunAdi
        title: "Ürün Adı"
        role: "urunAdi"
        movable: false
        resizable: true
        //width: tableView.viewport.width / 3
    }

    TableViewColumn {
        id: stok
        title: "Stok"
        role: "stok"
        movable: false
        resizable: true
        //width: tableView.viewport.width / 3
    }
    TableViewColumn {
        id: etkilesim
        title: "Etkilesim"
        role: "Etkilesim"
        movable: false
        resizable: false

        delegate: Item {
            Button {
                id:duzenleButon
                text: "Düzenle" // ListModel'deki etkilesim öğesinin text özelliğini al
                onClicked: {
                    var currentIndex = styleData.row // Şu anki sıradaki indeksi alın
                    var urunStokIdValue = libraryModel.get(currentIndex).urunStokId // Kategori değerini alın

                    console.log("Button tıklandı: " + urunStokIdValue);
                    __rightPanel.urunStok=urunStokIdValue
                    __rightPanel.source = "qrc:/pages/stokTakipDuzenle.qml";

                }
            }
            Button {
                anchors.left:duzenleButon.right
                text: "Sil" // ListModel'deki etkilesim öğesinin text özelliğini al
                onClicked: {
                    var currentIndex = styleData.row // Şu anki sıradaki indeksi alın
                    var urunStokIdValue = libraryModel.get(currentIndex).urunStokId // Kategori değerini alın

                    console.log("Button tıklandı: " + urunStokIdValue);
                    __rightPanel.urunStok=urunStokIdValue
                    __rightPanel.source = "qrc:/pages/stokTakipSil.qml";

                }
            }
        }
    }


    model: ListModel {
        id: libraryModel
        ListElement {
            urunStokId:"1"
            kategori: "Yem"
            stok: "20"
            urunAdi:"Optima Z10"
            etkilesim:"sil"

        }
        ListElement {
            urunStokId:"2"
            kategori: "Araç"
            stok: "10"
            urunAdi:"New Holland TD85"
        }
        ListElement {
            urunStokId:"3"
            kategori: "Sağım"
            urunAdi: "Sezer Sağım Makinesi"
            stok: "3"


        }
    }

    rowDelegate: Rectangle {
        color: styleData.selected ? "red" : "#242227"
        width: 2000
        height: 40
        border.width: 1
    }

}


