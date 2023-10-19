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

bool sqlOlustur(){

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    bool ok=false;
    if(!db.isOpen()){
        db.setHostName("local");
        db.setDatabaseName("benimCiftligim");
        db.setUserName("batuhan");
        db.setPassword("admin");
        ok = db.open();
    }
    else{
        ok=true;
    }

    return ok;

}


int main(int argc, char *argv[])
{
//    static const char* ciftlikOtomasyonController  = "COtomasyon.Controllers";

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    COtomasyonApplication app(argc, argv);
    app.initCommon(app);

    DataBase * dataBase= new DataBase;


    qDebug()<<"sql server açıldı:"<<dataBase->veriTabaniniOlustur("local","benimCiftligim",
                                                                  "batuhan","admin");

    qDebug()<<"Tablolar oluştu:"<<dataBase->tablolariOlustur();

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    qmlRegisterSingletonType<ScreenToolsController> ("COtomasyon.ScreenToolsController",    1, 0, "ScreenToolsController",  screenToolsControllerSingletonFactory);










    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
