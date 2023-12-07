#include "ayarlarsayfasi.h"


ayarlarSayfasi::ayarlarSayfasi(QObject *parent)
{


}

ayarlarSayfasi::~ayarlarSayfasi()
{

}

void ayarlarSayfasi::ayarlarSayfasiVerileriKaydet(QString defaultApiUrl,QString defaultApiUserName,QString defaultApiPassword)
{

    settings.beginGroup("ayarlar");
    settings.setValue("defaultApiUrl", "");
    settings.setValue("defaultApiUserName", "");
    settings.setValue("defaultApiPassword", "");
    settings.endGroup();

}
