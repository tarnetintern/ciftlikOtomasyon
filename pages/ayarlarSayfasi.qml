
import QtQuick 2.11
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3

import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

import COtomasyon.Ayarlar 1.0

Item {
    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: mainWindow.width
    property double defaultHeight: mainWindow.height
    property bool tinyScreen : Screen.desktopAvailableWidth < 700

    property int    defaultFontPixelWidth: tinyScreen ? 10:20
    property int    defaultFontPixelHeight: tinyScreen ? 5:10
    property int    largeFontPointSize: 30
    property var verilerListesi:[]


    GridLayout{
        columns: 2
        columnSpacing: largeFontPointSize
        anchors.centerIn: parent

        Text {
            id: defaultApiUrlId
            text: qsTr("Api Bilgisi")
            font.pointSize: 24
        }
        TextField{
            id:defaultApiUrl
            Layout.fillWidth: true
        }
        Text {
            id: defaultApiUserNameId
            text: qsTr("Api UserName")
            font.pointSize: 24
        }
        TextField{
            id:defaultApiUserName
            Layout.fillWidth: true
        }
        Text {
            id: defaultApiPasswordId
            text: qsTr("Api Password")
            font.pointSize: 24
        }
        TextField{
            id:defaultApiPassword
            Layout.fillWidth: true
        }
        Button{
            text: "Kaydet"
            onClicked: {
                Ayarlar.ayarlarSayfasiVerileriKaydet(defaultApiUrl.text,defaultApiUserName.text,defaultApiPassword.text)
                console.log("kaydedildi")
                onayYazisi.text="Kaydedildi"
            }
        }
        Text {
            id: onayYazisi
            color: "#61ff05"
            text: qsTr("")
            font.pointSize: 24

        }

        Component.onCompleted: {
            verilerListesi=Ayarlar.ayarlarSayfasiVerileriGetir()
            defaultApiUrl.text=verilerListesi[0]
            defaultApiUserName.text=verilerListesi[1]
            defaultApiPassword.text=verilerListesi[2]
        }

    }
}
