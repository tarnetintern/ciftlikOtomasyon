#ifndef DataBase_H
#define DataBase_H


#include<QApplication>
#include <QTimer>
#include <QElapsedTimer>
#include <QMap>
#include <QSet>
#include <QMetaMethod>
#include <QMetaObject>
#include <QGuiApplication>
#include <QQuickItem>

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>

class DataBase : public QQuickItem{

    Q_OBJECT
public:

    DataBase();
    ~DataBase();


    bool veriTabaniniOlustur(QString setHostName,QString setDatabaseName,
                             QString setUserName,QString setPassword);
    bool tablolariOlustur();
    QSqlDatabase db;




};
#endif
