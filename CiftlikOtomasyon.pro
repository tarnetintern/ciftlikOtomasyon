QT += quick\
      widgets \
      bluetooth \

QT += sql
#QT += 3dcore

android{
QT += androidextras

DISTFILES += \
    android/AndroidManifest.xml \
    android/src/org/ciftlikOtomasyon/VolumeControl.java

SOURCES += \
    src/androidvolumecontrol.cpp

HEADERS +=\
    src/androidvolumecontrol.h
}

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
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
        evkontrolpaneli.cpp \
        main.cpp\
        screenTools/ScreenToolsController.cc\
        src/COtomasyonApplication.cc\
        src/androidvolumecontrol.cpp \
        src/ayarlarsayfasi.cpp \
        src/bluetooth.cpp \
        src/dataBase.cc


HEADERS +=\
        evkontrolpaneli.h \
        screenTools/ScreenToolsController.h\
        src/COtomasyonApplication.h\
        src/androidvolumecontrol.h \
        src/ayarlarsayfasi.h \
        src/bluetooth.h \
        src/dataBase.h

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

