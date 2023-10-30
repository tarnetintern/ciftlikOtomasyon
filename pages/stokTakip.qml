import QtQuick 2.11
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3

import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

Rectangle{
    id:stokTakipWindow
    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: stokTakipWindow.width
    property double defaultHeight: stokTakipWindow.height

    property int    _defaultFontPixelWidth: 20
    property int    _defaultFontPixelHeight: 10
    property int    largeFontPointSize: 30
    color: "#242227"


    readonly property real _horizontalMargin:   _defaultFontPixelWidth / 2
    readonly property real _verticalMargin:     _defaultFontPixelHeight / 2
    readonly property real _buttonHeight:       ScreenToolsController.isTinyScreen ? _defaultFontPixelHeight * 3 : _defaultFontPixelHeight * 2





    Flickable {
        id:                 buttonList
        width:              buttonColumn.width
        anchors.topMargin:  _verticalMargin
        anchors.top:        parent.top
        anchors.bottom:     parent.bottom
        anchors.leftMargin: _horizontalMargin
        anchors.left:       parent.left
        contentHeight:      buttonColumn.height + _verticalMargin
        flickableDirection: Flickable.VerticalFlick
        clip:               true


        ColumnLayout {
            id:         buttonColumn
            spacing:    _verticalMargin
            property real _maxButtonWidth: 0
            Button{
                text: "Stoklar"

                onClicked: {
                    __rightPanel.source = "qrc:/pages/stokTakipStoklar.qml"
                }
            }
            Button{
                text: "Ekle"
                onClicked: {
                    __rightPanel.source = "qrc:/pages/stokTakipEkle.qml"
                }
            }
            Button{
                text: "Düzenle"
                onClicked: {
                    __rightPanel.source = "qrc:/pages/stokTakipDuzenle.qml"
                }
            }
            Button{
                text: "Sil"
                onClicked: {
                    __rightPanel.source = "qrc:/pages/stokTakipSil.qml"
                }
            }



        }
    }

    Rectangle {
            id:                     divider
            anchors.topMargin:      _verticalMargin
            anchors.bottomMargin:   _verticalMargin
            anchors.leftMargin:     _horizontalMargin
            anchors.left:           buttonList.right
            anchors.top:            parent.top
            anchors.bottom:         parent.bottom
            width:                  1
            color:                  "red"
        }
    Loader {
            id:                     __rightPanel
            anchors.leftMargin:     _horizontalMargin
            anchors.rightMargin:    _horizontalMargin
            anchors.topMargin:      _verticalMargin
            anchors.bottomMargin:   _verticalMargin
            anchors.left:           divider.right
            anchors.right:          parent.right
            anchors.top:            parent.top
            anchors.bottom:         parent.bottom
            //bunun soruce degerine source qrc kısmını ver ve işle
        }
}
