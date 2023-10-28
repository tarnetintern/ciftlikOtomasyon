#include "dataBase.h"

DataBase::DataBase()
{

}

DataBase::~DataBase()
{

}

bool DataBase::veriTabaniniOlustur(QString setHostName, QString setDatabaseName, QString setUserName, QString setPassword)
{



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

bool DataBase::veriTabaniKayitEkle(QString hayvanTuru, QString hayvanAdi, QString kupeNo, QString dogumTarihi, QString olumTarihi,
                                   int yavruSayisi, QString anneKupeNo, QString babaKupeNo)
{

    qDebug()<<hayvanTuru<<hayvanAdi<<kupeNo<<dogumTarihi<<olumTarihi<<yavruSayisi<<anneKupeNo<<babaKupeNo;

    if (db.open()) {
        QSqlQuery query;

        // INSERT INTO sorgusu ile veriyi ekleyin
        query.prepare("INSERT INTO hayvanlar (hayvan_turu, hayvan_adi, kupe_no, dogum_tarihi, olum_tarihi, yavru_sayisi, anne_kupe_no, baba_kupe_no) "
                      "VALUES (:hayvan_turu, :hayvan_adi, :kupe_no, :dogum_tarihi, :olum_tarihi, :yavru_sayisi, :anne_kupe_no, :baba_kupe_no)");

        query.bindValue(":hayvan_turu", hayvanTuru);
        query.bindValue(":hayvan_adi", hayvanAdi);
        query.bindValue(":kupe_no", kupeNo);
        query.bindValue(":dogum_tarihi", dogumTarihi);
        query.bindValue(":olum_tarihi", olumTarihi);
        query.bindValue(":yavru_sayisi", yavruSayisi);
        query.bindValue(":anne_kupe_no", anneKupeNo);
        query.bindValue(":baba_kupe_no", babaKupeNo);

        if (query.exec()) {
            qDebug() << "Veri başarıyla eklendi.";
        } else {
            qDebug() << "Veri eklerken hata oluştu: " << query.lastError().text();
        }

        // Veritabanı bağlantısını kapatmayı unutmayın
        //db.close();
        return true;
    } else {
        qDebug() << "Veritabanı bağlantısı başarısız oldu.";
        return false;
    }



}



bool DataBase::veriTabaniKayitSil()
{


    return true;
}

QList<QString> DataBase::veriTabaniSorgulamaYap(QString kupeNo)
{
    QList<QString> kupelerListesi;
    //eğer gelen sorgu bos olursa hepsini listelerim bos degilse kupe no uzerinden veri aktarımı yaparım :)
    qDebug() <<"sorgulanan kupe no: "<<kupeNo;

    if (db.open()) {
        QSqlQuery query;
        query.prepare("SELECT * FROM hayvanlar"); // "hayvanlar" tablosundaki tüm verileri al

        if (query.exec()) {
            while (query.next()) {
                // Her bir satırı işleyin ve istediğiniz verilere erişin
                QString hayvanTuru = query.value(0).toString();
                QString hayvanAdi = query.value(1).toString();
                QString kupeNo = query.value(2).toString();
                // Diğer sütunları benzer şekilde alabilirsiniz

                // Alınan verileri kullanabilir veya görüntüleyebilirsiniz
                qDebug() << "Hayvan Türü: " << hayvanTuru;
                qDebug() << "Hayvan Adı: " << hayvanAdi;
                qDebug() << "Kupe No: " << kupeNo;
                // Diğer verileri de görüntüleyebilirsiniz

                kupelerListesi.append(kupeNo);
            }
        } else {
            qDebug() << "Sorgu çalıştırma hatası: " << query.lastError().text();
        }

        // Veritabanı bağlantısını kapatmayı unutmayın
        //db.close();
    } else {
        qDebug() << "Veritabanı bağlantısı başarısız oldu.";
    }

    return kupelerListesi;

}


