#include "ayarlarsayfasi.h"


ayarlarSayfasi::ayarlarSayfasi(QObject *parent) : QObject(parent)
    , settings("BTHN", "CiftlikOtomasyon")
{

}

ayarlarSayfasi::~ayarlarSayfasi()
{

}

void ayarlarSayfasi::ayarlarSayfasiVerileriKaydet(QString defaultApiUrl,QString defaultApiUserName,QString defaultApiPassword)
{

    settings.beginGroup("ayarlar");
    settings.setValue("defaultApiUrl", defaultApiUrl);
    settings.setValue("defaultApiUserName", defaultApiUserName);
    settings.setValue("defaultApiPassword", defaultApiPassword);
    settings.endGroup();



}

QList<QString> ayarlarSayfasi::ayarlarSayfasiVerileriGetir()
{
    QList<QString> veriler;


    settings.beginGroup("ayarlar");
    QString apiUrl = settings.value("defaultApiUrl").toString();
    QString apiUserName = settings.value("defaultApiUserName").toString();
    QString apiPassword = settings.value("defaultApiPassword").toString();
    settings.endGroup();

    veriler.append(apiUrl);
    veriler.append(apiUserName);
    veriler.append(apiPassword);
    return veriler;
}
