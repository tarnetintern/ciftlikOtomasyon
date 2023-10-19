#include "dataBase.h"

DataBase::DataBase()
{

}

DataBase::~DataBase()
{

}

bool DataBase::veriTabaniniOlustur(QString setHostName, QString setDatabaseName, QString setUserName, QString setPassword)
{


    db = QSqlDatabase::addDatabase("QSQLITE");
//    db.setDatabaseName("src/veritabani.db");
    bool ok=false;
    if(!db.isOpen()){
        db.setHostName(setHostName);
        db.setDatabaseName(setDatabaseName);
        db.setUserName(setUserName);
        db.setPassword(setPassword);
        if (db.open()) {
            ok = true;
        }
    }
    else{
        ok=true;
    }

    return ok;

}

bool DataBase::tablolariOlustur()
{
    qDebug()<<"tablo olusturuluyor";
    if (db.tables().isEmpty()) {
        QString createTableQuery = "CREATE TABLE hayvanlar ("
                                   "hayvan_turu TEXT, "
                                   "hayvan_adi TEXT, "
                                   "kupe_no TEXT, "
                                   "dogum_tarihi DATE, "
                                   "olum_tarihi DATE, "
                                   "yavru_sayisi INTEGER, "
                                   "anne_kupe_no TEXT, "
                                   "baba_kupe_no TEXT)";

        QSqlQuery query(db);
        if (query.exec(createTableQuery)) {
            qDebug()<<"tablo olusturuldu";
            return true;
        } else {
            qDebug() << "Tablo oluşturma hatası: " <<query.lastError().text() ;
            return false;
        }
    }else{
        qDebug()<<"tablo bos degil";
        return false;

    }
}
