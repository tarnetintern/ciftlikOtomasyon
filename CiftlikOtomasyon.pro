QT += quick\
      widgets \


#QT += 3dcore


#QT += 3dcore 3drender 3dinput 3dquick qml 3dquickextras
#\
#    concurrent \
#    gui \
#    location \
#    network \
#    opengl \
#    positioning \
#    qml \
#    quick \
#    quickcontrols2 \
#    quickwidgets \
#    sql \
#    svg \
#    widgets \
#    xml \
#    texttospeech \
#    core-private



# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp\
        screenTools/ScreenToolsController.cc\
        src/COtomasyonApplication.cc


HEADERS +=\
        screenTools/ScreenToolsController.h\
        src/COtomasyonApplication.h

RESOURCES +=\
        models.qrc \
        qml.qrc\
        images.qrc

INCLUDEPATH+=pages/
INCLUDEPATH+=screenTools/
INCLUDEPATH+=src/
INCLUDEPATH+=hayvanGorselleri/
RESOURCES += hayvanGorselleri/
# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
