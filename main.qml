import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3

import COtomasyon.ScreenToolsController 1.0

import COtomasyon.DataBase 1.0

ApplicationWindow {

    id:mainWindow
    property bool tinyScreen : Screen.desktopAvailableWidth < 700
    //1920x1080
    width: tinyScreen ? Screen.desktopAvailableWidth:1920
    height: tinyScreen ? Screen.desktopAvailableHeight:1080
    visible: true
    title: qsTr("Ciftlik Otomasyon")

    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: mainWindow.width
    property double defaultHeight: mainWindow.height

    property int    defaultFontPixelWidth: tinyScreen ? 10:20
    property int    defaultFontPixelHeight: tinyScreen ? 5:10
    property int    largeFontPointSize: 30
    property int    toolbarHeight: tinyScreen ? 30*3 : 30*3

    property int    defaultWidthSplit: 6
    property int    defaultHeightSplit: 6
    property int    defaultBoxNumber: 7
    property var    boxNames:
        ["Anomaliler","Hayvan Sorgulama",
        "Yem Yeme Süresi","Stok Takip",
        "Hayvan Ekleme","Bluetooth","Ev Kontrol Paneli"]

    property bool   isAndroid :ScreenToolsController.isAndroid
    property bool   isWindows :ScreenToolsController.isWindows


    function qmlPageOpener(whichPage){
        console.log("deneme")
        console.log(isAndroid)
        if(whichPage==="Anomaliler"){
            showTool(qsTr("Anomaliler"), "pages/anomaliler.qml", "uyari")
        }
        else if(whichPage==="Hayvan Sorgulama"){
            showTool(qsTr("Hayvan Sorgulama"), "pages/hayvanSorgulama.qml", "inek")
        }
        else if(whichPage==="Yem Yeme Süresi"){
            showTool(qsTr("Yem Yeme Süresi"), "pages/yemYemeSuresi.qml", "yem")
        }
        else if(whichPage==="Stok Takip"){
            showTool(qsTr("Stok Takip"), "pages/stokTakip.qml", "stokTakip")
        }
        else if(whichPage==="Hayvan Ekleme"){
            showTool(qsTr("Hayvan Ekleme"), "pages/hayvanEkleme.qml", "inek")
        }
        else if(whichPage==="Bluetooth"){
            showTool(qsTr("Bluetooth"), "pages/bluetooth.qml", "inek")
        }
        else if(whichPage==="Ev Kontrol Paneli"){
            showTool(qsTr("Ev Kontrol Paneli"), "pages/evKontrolPaneli.qml", "inek")
        }

    }

    Rectangle{
        width: defaultWidth
        height:defaultHeight
        color: "#242227"

        Item {
            id: otomasyonlarAnaItem
            y:defaultFontPixelWidth
            x:defaultFontPixelWidth

            GridLayout{
                columns: 2
                columnSpacing: defaultSpacing

                Repeater{
                    model: defaultBoxNumber

                    delegate: Rectangle{

                        width: defaultWidth/defaultWidthSplit+defaultSpacing
                        height: defaultHeight/defaultHeightSplit
                        color: "#9a1d49"
                        Text {
                            anchors.centerIn: parent
                            text: boxNames[index]
                            font.pixelSize: defaultFontPixelWidth
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {

                                qmlPageOpener(boxNames[index])
                            }
                        }
                    }
                }
            }
        }
    }

    function showTool(toolTitle, toolSource, toolIcon) {
        toolDrawer.backIcon     = "ciftlikIcon50px"
        toolDrawer.toolTitle    = toolTitle
        toolDrawer.toolSource   = toolSource
        toolDrawer.toolIcon     = toolIcon
        toolDrawer.visible      = true
    }

    Drawer {
        id:             toolDrawer
        width:          mainWindow.width
        height:         mainWindow.height
        edge:           Qt.LeftEdge
        dragMargin:     0
        closePolicy:    Drawer.NoAutoClose
        interactive:    false
        visible:        false

        property alias backIcon:    backIcon.source
        property alias toolTitle:   toolbarDrawerText.text
        property alias toolSource:  toolDrawerLoader.source
        property alias toolIcon:    toolIcon.source
        readonly property alias item : toolDrawerLoader.item

        Rectangle {
            id:             toolDrawerToolbar
            anchors.left:   parent.left
            anchors.right:  parent.right
            anchors.top:    parent.top
            height:         toolbarHeight
            color:          "#9a1d49"

            RowLayout {
                anchors.leftMargin: defaultFontPixelWidth
                anchors.left:       parent.left
                anchors.top:        parent.top
                anchors.bottom:     parent.bottom
                spacing:            defaultFontPixelWidth

                Image {
                    id:                     backIcon
                    width:                  defaultFontPixelHeight/2
                    height:                 defaultFontPixelHeight/2
                    fillMode:               Image.PreserveAspectFit
                    mipmap:                 true

                }

                Label {
                    id:     backTextLabel
                    font.pointSize: defaultFontPixelWidth
                    text:   qsTr("Geri")
                }

                Label {
                    font.pointSize: defaultFontPixelWidth
                    text:           "<"
                }

                Image {
                    id: toolIcon
                    width: toolbarHeight * 0.6 // Toolbar yüksekliğinin %60'ı olarak ayarla
                    height: toolbarHeight * 0.6 // Yüksekliği, genişliğe eşit tut

                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                Label {
                    id:             toolbarDrawerText
                    font.pointSize: defaultFontPixelWidth
                }
            }

            MouseArea {
                anchors.top:        parent.top
                anchors.bottom:     parent.bottom
                x:                  parent.mapFromItem(backIcon, backIcon.x, backIcon.y).x
                width:              (backTextLabel.x + backTextLabel.width) - backIcon.x
                onClicked: {
                    toolDrawer.visible      = false
                    toolDrawer.toolSource   = ""
                }
            }
        }

        Loader {
            id:             toolDrawerLoader
            anchors.left:   parent.left
            anchors.right:  parent.right
            anchors.top:    toolDrawerToolbar.bottom
            anchors.bottom: parent.bottom

            Connections {
                target:                 toolDrawerLoader.item
                ignoreUnknownSignals:   true
                onPopout:               toolDrawer.visible = false
            }
        }
    }

    Component.onCompleted: {
        console.log("yuklendi")
        console.log("Veri tabanı olusturma: "+DataBase.veriTabaniniOlustur("local","ciftlikotomasyon.db","batuhan","admin"))
        console.log("Tabloları olusturma hayvanlar: "+DataBase.tablolariOlustur())
        //console.log("Tabloları olusturma stoklar: "+DataBase.tablolariOlusturStok())
        console.log("Screen.desktopAvailableWidth"+Screen.desktopAvailableWidth)
        console.log("Screen.desktopAvailableHeight"+Screen.desktopAvailableHeight)
    }


}
