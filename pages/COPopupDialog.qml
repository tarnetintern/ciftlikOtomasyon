
import QtQuick                      2.12
import QtQuick.Controls             2.4
import QtQuick.Layouts              1.12
import QtQuick.Dialogs              1.3

import COtomasyon.ScreenToolsController 1.0

Popup {
    id:                 _root
    parent:             Overlay.overlay
    anchors.centerIn:   parent
    width:              mainColumnLayout.width + (padding * 2)
    height:             mainColumnLayout.y + mainColumnLayout.height + padding
    padding:            2
    modal:              true
    focus:              true

    property string title
    property var    buttons:                StandardButton.Ok
    property bool   acceptAllowed:          acceptButton.visible
    property bool   rejectAllowed:          rejectButton.visible
    property alias  acceptButtonEnabled:    acceptButton.enabled
    property alias  rejectButtonEnabled:    rejectButton.enabled
    property var    dialogProperties
    property bool   destroyOnClose:         true
    property bool   preventClose:           false

    signal accepted
    signal rejected


    property real   _frameSize:         20
    property real   _contentMargin:     20 / 2
    property real   _popupDoubleInset:  20 * 2
    property real   _maxContentWidth:   parent.width - _popupDoubleInset
    property real   _maxContentHeight:  parent.height - titleRowLayout.height - _popupDoubleInset

    background: Item {
        Rectangle {
            anchors.left:   parent.left
            anchors.top:    parent.top
            width:          _frameSize
            height:         _frameSize
            color:          "green"
            visible:        enabled
        }

        Rectangle {
            anchors.right:  parent.right
            anchors.top:    parent.top
            width:          _frameSize
            height:         _frameSize
            color:          "blue"
            visible:        enabled
        }

        Rectangle {
            anchors.left:   parent.left
            anchors.bottom: parent.bottom
            width:          _frameSize
            height:         _frameSize
            color:          "blue"
            visible:        enabled
        }

        Rectangle {
            anchors.right:  parent.right
            anchors.bottom: parent.bottom
            width:          _frameSize
            height:         _frameSize
            color:          "blue"
            visible:        enabled
        }

        Rectangle {
            anchors.margins:    _root.padding
            anchors.fill:       parent
            color:              "#3ebcc8"
        }
    }

    Component.onCompleted: {

        contentChildren[contentChildren.length - 1].parent = dialogContentParent
    }

    onAboutToShow: setupDialogButtons(buttons)
    onClosed: {
        Qt.inputMethod.hide()
        if (destroyOnClose) {
            _root.destroy()
        }
    }

    function _accept() {
        if (acceptAllowed) {
            accepted()
            if (preventClose) {
                preventClose = false
            } else {
                close()
            }
        }
    }

    function _reject() {
        if (rejectAllowed) {
            rejected()
            if (preventClose) {
                preventClose = false
            } else {
                close()
            }
        }
    }


    function setupDialogButtons(buttons) {
        acceptButton.visible = false
        rejectButton.visible = false
        // Accept role buttons
        if (buttons & StandardButton.Ok) {
            acceptButton.text = qsTr("Ok")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Open) {
            acceptButton.text = qsTr("Open")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Save) {
            acceptButton.text = qsTr("Save")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Apply) {
            acceptButton.text = qsTr("Apply")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Open) {
            acceptButton.text = qsTr("Open")
            acceptButton.visible = true
        } else if (buttons & StandardButton.SaveAll) {
            acceptButton.text = qsTr("Save All")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Yes) {
            acceptButton.text = qsTr("Yes")
            acceptButton.visible = true
        } else if (buttons & StandardButton.YesToAll) {
            acceptButton.text = qsTr("Yes to All")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Retry) {
            acceptButton.text = qsTr("Retry")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Reset) {
            acceptButton.text = qsTr("Reset")
            acceptButton.visible = true
        } else if (buttons & StandardButton.RestoreToDefaults) {
            acceptButton.text = qsTr("Restore to Defaults")
            acceptButton.visible = true
        } else if (buttons & StandardButton.Ignore) {
            acceptButton.text = qsTr("Ignore")
            acceptButton.visible = true
        }

        // Reject role buttons
        if (buttons & StandardButton.Cancel) {
            rejectButton.text = qsTr("Cancel")
            rejectButton.visible = true
        } else if (buttons & StandardButton.Close) {
            rejectButton.text = qsTr("Close")
            rejectButton.visible = true
        } else if (buttons & StandardButton.No) {
            rejectButton.text = qsTr("No")
            rejectButton.visible = true
        } else if (buttons & StandardButton.NoToAll) {
            rejectButton.text = qsTr("No to All")
            rejectButton.visible = true
        } else if (buttons & StandardButton.Abort) {
            rejectButton.text = qsTr("Abort")
            rejectButton.visible = true
        }

        if (rejectButton.visible) {
            closePolicy = Popup.NoAutoClose | Popup.CloseOnEscape
        } else {
            closePolicy = Popup.NoAutoClose
        }
    }

    function disableAcceptButton() {
        acceptButton.enabled = false
    }

    Rectangle {
        width:  titleRowLayout.width
        height: titleRowLayout.height
        color:  "brown"
    }

    ColumnLayout {
        id:         mainColumnLayout
        spacing:    _contentMargin

        RowLayout {
            id:                 titleRowLayout
            Layout.fillWidth:   true

            Label {
                Layout.leftMargin:  20
                Layout.fillWidth:   true
                text:               _root.title
                font.pointSize:     20
                verticalAlignment:	Text.AlignVCenter
            }

            Button {
                id:         rejectButton
                onClicked:  _reject()
            }

            Button {
                id:         acceptButton

                onClicked:  _accept()
            }
        }

        Flickable {
            id:                     mainFlickable
            Layout.preferredWidth:  Math.min(Math.max(marginItem.width, mainColumnLayout.width), _maxContentWidth)
            Layout.preferredHeight: Math.min(marginItem.height, _maxContentHeight)
            contentWidth:           marginItem.width
            contentHeight:          marginItem.height

            Item {
                id:     marginItem
                width:  dialogContentParent.width + (_contentMargin * 2)
                height: dialogContentParent.height + _contentMargin

                Item {
                    id:     dialogContentParent
                    x:      _contentMargin
                    width:  childrenRect.width
                    height: childrenRect.height
                    focus:  true

                    Keys.onReleased: {
                        if (event.key === Qt.Key_Escape) {
                            _reject()
                            event.accepted = true
                        } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            _accept()
                            event.accepted = true
                        }
                    }

                }
            }
        }
    }
}
