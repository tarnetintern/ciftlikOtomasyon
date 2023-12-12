#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ScreenToolsController.h"
#include<QApplication>
#include "COtomasyonApplication.h"
#include <QSqlDatabase>

#include <QDebug>

#include "dataBase.h"

#include "bluetooth.h"

#include "evKontrolPaneli.h"

#include "ayarlarsayfasi.h"

static QObject* screenToolsControllerSingletonFactory(QQmlEngine*, QJSEngine*)
{
    ScreenToolsController* screenToolsController = new ScreenToolsController;
    return screenToolsController;
}

static QObject* databaseToolsControllerSingletonFactory(QQmlEngine*, QJSEngine*)
{
    DataBase* dataBase = new DataBase;
    return dataBase;
}

static QObject* bluetoothSingletonFactory(QQmlEngine*, QJSEngine*)
{
    Bluetooth* scanner = new Bluetooth;
    return scanner;
}

static QObject* evKontrolPaneliSingletonFactory(QQmlEngine*, QJSEngine*)
{
    EvKontrolPaneli* evControl = new EvKontrolPaneli;
    return evControl;
}

static QObject* AyarlarToolsControllerSingletonFactory(QQmlEngine*, QJSEngine*)
{
    ayarlarSayfasi* ayarlar = new ayarlarSayfasi;
    return ayarlar;
}

bool bluetooth(){
    Bluetooth scanner;
    //scanner.startScan();
    scanner.bluetoothAc();
    return true;
}

//bool QCoreApplication::notify(QObject* object, QEvent* event)
//{

//#ifndef Q_OS_ANDROID
//        if (event->type() == QEvent::KeyPress) {
//        QKeyEvent* keyEvent = static_cast<QKeyEvent*>(event);
//        if (keyEvent->key() == Qt::Key_Back)
//        {
//            qDebug() << "back key got pressed!";
//            keyEvent->accept();
//            return true;
//        }
//    }
//#endif // Q_OS_ANDROID
//    return true;

//}

int main(int argc, char *argv[])
{
//    static const char* ciftlikOtomasyonController  = "COtomasyon.Controllers";
    QCoreApplication::setOrganizationName("BTHN");
    QCoreApplication::setApplicationName("CiftlikOtomasyon");

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    COtomasyonApplication app(argc, argv);
    app.initCommon(app);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    qmlRegisterSingletonType<ScreenToolsController> ("COtomasyon.BluetoothController",    1, 0, "BluetoothController",  bluetoothSingletonFactory);
    qmlRegisterSingletonType<ScreenToolsController> ("COtomasyon.ScreenToolsController",    1, 0, "ScreenToolsController",  screenToolsControllerSingletonFactory);
    qmlRegisterSingletonType<DataBase> ("COtomasyon.DataBase",    1, 0, "DataBase",  databaseToolsControllerSingletonFactory);
    qmlRegisterSingletonType<EvKontrolPaneli> ("COtomasyon.evControl",    1, 0, "EvControl",  evKontrolPaneliSingletonFactory);
    qmlRegisterSingletonType<EvKontrolPaneli> ("COtomasyon.Ayarlar",    1, 0, "Ayarlar",  AyarlarToolsControllerSingletonFactory);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
