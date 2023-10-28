#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ScreenToolsController.h"
#include<QApplication>
#include "COtomasyonApplication.h"
#include <QSqlDatabase>

#include <QDebug>

#include "dataBase.h"

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

int main(int argc, char *argv[])
{
//    static const char* ciftlikOtomasyonController  = "COtomasyon.Controllers";

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    COtomasyonApplication app(argc, argv);
    app.initCommon(app);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    qmlRegisterSingletonType<ScreenToolsController> ("COtomasyon.ScreenToolsController",    1, 0, "ScreenToolsController",  screenToolsControllerSingletonFactory);
    qmlRegisterSingletonType<DataBase> ("COtomasyon.DataBase",    1, 0, "DataBase",  databaseToolsControllerSingletonFactory);


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
