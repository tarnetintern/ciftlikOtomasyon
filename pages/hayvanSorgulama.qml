import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15


import QtQuick.Controls 2.4
import QtQuick.Dialogs  1.3

import COtomasyon.ScreenToolsController 1.0


Item{
    id:hayvanSorgulamaRoot
    property string hayvanResimleriPath: "/hayvanGorselleri/inek2.png"

    property double defaultSpacing: screen.desktopAvailableWidth/40
    property double defaultWidth: mainWindow.width
    property double defaultHeight: mainWindow.height

    property int    defaultFontPixelWidth: 20
    property int    defaultFontPixelHeight: 10
    property int    largeFontPointSize: 30

    Rectangle{
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "red"


        Image {
            id: hayvan
            y: 166
            source: hayvanResimleriPath
            anchors.leftMargin: 8
            width: Screen.desktopAvailableWidth/7
            height: Screen.desktopAvailableHeight/7
            anchors.centerIn: parent.Center
            anchors.left: parent.left
        }

        TextField{
            id:kupeNo
            anchors.left: hayvan.right
            anchors.leftMargin: -1
            x:400
            y: 69
            width: parent.width-hayvan.width-30
            height: 41



        }

        Repeater{
            model:11

            delegate: Button{
                id:buttonKu
                anchors.top: kupeNo.bottom
                text: index !== 10 ? index:"sil"
                width: 50
                height: 50
                x:300+(index*(buttonKu.width+10))
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


    }
    ListModel {
        id:contactModel
        ListElement {
            name: "Bill Smith"
            number: "555 3264"
        }
        ListElement {
            name: "John Brown"
            number: "555 8426"
        }
        ListElement {
            name: "Sam Wise"
            number: "555 0473"
        }
    }

    ListView {
        x: 252
        y: 166

        width: 371; height: 298

        model: contactModel
        delegate: Text {
            text: name + ": " + number
        }
    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

