import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.11

import COtomasyon.ScreenToolsController 1.0
import COtomasyon.BluetoothController 1.0

Rectangle {
    id: anomaliler
    color: "#242227"
    width: parent.width
    height: parent.height
    property string isimler:""
    property var isimListesi: []

    function ekle(yeniIsim) {
        console.log(yeniIsim)
        isimListesi.push(yeniIsim);

        isimler+=(yeniIsim+"\n");




    }

    Connections {
        target: BluetoothController
        onDeviceListChanged: {
            //console.log(veri) // veri değişkenini log'la
            ekle(veri) // veri değişkenini listeye ekle
        }
    }
    Text{
        width:500
        height: 500
        color: "#ff0000"
        text:isimler
    }

    Connections {
        target: BluetoothController
        onDeviceListChanged: {
            //console.log(veri) // veri değişkenini log'la
            ekle(veri) // veri değişkenini listeye ekle
        }
    }



    Button {
        x: 600
        y: 600
        width: 100
        height: 100
        text: "Başlat"
        z: 10000

        onClicked: {
            console.log("başlatıldı")
            BluetoothController.startScan()
        }
    }


}
