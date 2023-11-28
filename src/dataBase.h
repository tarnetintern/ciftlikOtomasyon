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
#include <QDate>
class DataBase : public QQuickItem{

    Q_OBJECT
public:

    DataBase();
    ~DataBase();


    Q_INVOKABLE bool veriTabaniniOlustur(QString setHostName,QString setDatabaseName,
                             QString setUserName,QString setPassword);
    Q_INVOKABLE bool tablolariOlustur();



    Q_INVOKABLE bool veriTabaniKayitEkle(QString hayvanTuru,QString hayvanAdi,
                                         QString kupeNo,QString dogumTarihi,
                                         QString olumTarihi,int yavruSayisi,
                                         QString anneKupeNo,QString babaKupeNo);

    Q_INVOKABLE bool veriTabaniKayitSil();

    Q_INVOKABLE QVariantList veriTabaniSorgulamaYap(QString kupeNo);
    Q_INVOKABLE QString veriTabaniGuncellemeYap(QString hayvanTuru,QString hayvanAdi,
                                                QString kupeNo,QString dogumTarihi,
                                                QString olumTarihi,int yavruSayisi,
                                                QString anneKupeNo,QString babaKupeNo);

    Q_INVOKABLE bool veriTabaniKayitEkleKategoriler(QString kategori_adi);
    Q_INVOKABLE bool veriTabaniKayitEkleStok(QString kategori_adi,QString urun_adi,QString sku_no,QDate eklenme_tarihi,int stok_adet);




    QSqlDatabase db=QSqlDatabase::addDatabase("QSQLITE");






};
#endif
