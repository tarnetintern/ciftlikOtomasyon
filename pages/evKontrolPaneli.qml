import QtQuick 2.15
import COtomasyon.evControl 1.0

import QtQuick.Controls             2.4
import QtQuick.Dialogs              1.3
import QtQuick.Layouts              1.11



Item {

    Rectangle{
        width: parent.width
        height: parent.height
        color:"red"


    }


    Button{
        id:acButton
        text:"aç"
        onClicked:{
            var url = "http://77.245.158.70:7171/webhook"; // POST isteği yapılacak URL
            var json = JSON.stringify({"ışıklar1": "1"});
            EvControl.baglan("","")
        }
    }

    Button{
        text:"kapat"
        anchors.left: acButton.right
        onClicked:{
            var url = "http://77.245.158.70:7171/webhook"; // POST isteği yapılacak URL
            var json = JSON.stringify({"ışıklar1": "1"});
            EvControl.baglan("","")
        }
    }

    Component.onCompleted: {
        EvControl.baglan("","")
    }

}
