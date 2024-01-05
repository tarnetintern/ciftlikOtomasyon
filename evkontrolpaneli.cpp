#include "evkontrolpaneli.h"


EvKontrolPaneli::EvKontrolPaneli(QObject *parent) : QObject(parent)
    ,manager (new QNetworkAccessManager(this))
    ,managerGet (new QNetworkAccessManager(this))
    ,managerAuth (new QNetworkAccessManager(this))
    ,timer(new QTimer(this))

{
    connect(manager, &QNetworkAccessManager::finished, this, &EvKontrolPaneli::handleApiResponse);
    connect(managerGet, &QNetworkAccessManager::finished, this, &EvKontrolPaneli::handleApiResponseGet);
    //qDebug()<<"constructor calisti";
    // Timer'ı ayarlayın ve performGetRequest slot'una bağlayın
    //timer->setInterval(10000); // 10 saniye
    //connect(timer, &QTimer::timeout, this, &EvKontrolPaneli::performGetRequest);
    //timer->start();
}

EvKontrolPaneli::~EvKontrolPaneli()
{
    if (manager != nullptr)
    {
        delete manager;
        manager = nullptr; // İşlem yapıldıktan sonra pointer'ı null yapmak iyi bir uygulamadır
        qDebug()<<"manager silindi1";
    }

    if (managerAuth != nullptr)
    {
        delete managerAuth;
        managerAuth = nullptr;
        qDebug()<<"manager2 silindi1";
    }

    if (timer != nullptr)
    {
        delete timer;
        timer = nullptr;
        qDebug()<<"manager3 silindi1";
    }


}

void EvKontrolPaneli::performGetRequest(QString url,QString kullaniciAdi,QString sifre)
{

    getData(url,kullaniciAdi,sifre); // Burada URL'nizi belirtin
}

void EvKontrolPaneli::handleApiResponseGet(QNetworkReply *reply)
{

    QVariant statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute);
    if (reply->error() == QNetworkReply::NoError) {

        // İstek başarılı, yanıtı oku
        QByteArray responseData = reply->readAll();
        QString responseString(responseData);

        // Yanıtı konsola yazdır veya gerektiği şekilde işle
        //qDebug() << "Sunucu Yanıtı:" << responseString;
        emit apiResponseReceivedGet(responseString,statusCode.toInt());
    } else {
        // Bir hata oluştu, hata mesajını yazdır
        qDebug() << "Hata:" << reply->errorString();
        emit apiResponseReceivedGet("responseString", statusCode.toInt());
    }

    reply->deleteLater();

}

bool EvKontrolPaneli::getData(QString url,QString kullaniciAdi,QString sifre)
{
    QUrl serviceUrl(url);
    QNetworkRequest request(serviceUrl);

    // HTTP Header ayarları
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    // Basic Auth için kullanıcı adı ve şifreyi Base64 ile kodlama
    QByteArray auth = kullaniciAdi.toUtf8() + ":" + sifre.toUtf8();
    auth = "Basic " + auth.toBase64();
    request.setRawHeader("Authorization", auth);

    // GET isteğini başlat
    managerGet->get(request);

    return true;
}
bool EvKontrolPaneli::baglanAuth(QString url, QString port, QString kullaniciAdi, QString sifre)
{
    return true;

}

bool EvKontrolPaneli::baglan(QString url, QString port)
{
    return true;
}

bool EvKontrolPaneli::baglantiyiKes()
{
    return true;
}

bool EvKontrolPaneli::baglantiyiKesAuth()
{
    return true;
}

bool EvKontrolPaneli::baglantiyiKontrolEt()
{
    return true;
}

bool EvKontrolPaneli::baglantiyiKontrolEtAuth()
{
    return true;
}

bool EvKontrolPaneli::postData(QString url, QString jsonData)
{
    QUrl serviceUrl = QUrl(url);
    QNetworkRequest request(serviceUrl);

    // HTTP Header ayarları
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    // JSON verisini QJsonDocument nesnesine dönüştürme
    QJsonDocument doc = QJsonDocument::fromJson(jsonData.toUtf8());

    // POST isteğini gönderme
    manager->post(request, doc.toJson());

    return true;
}

bool EvKontrolPaneli::postDataAuth(QString url, QString jsonData, QString kullaniciAdi, QString sifre)
{
    QUrl serviceUrl = QUrl(url);
    QNetworkRequest request(serviceUrl);

    // HTTP Header ayarları
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    // Basic Auth için kullanıcı adı ve şifreyi Base64 ile kodlama
    QByteArray auth = kullaniciAdi.toUtf8() + ":" + sifre.toUtf8();
    auth = "Basic " + auth.toBase64();
    request.setRawHeader("Authorization", auth);

    // JSON verisini QJsonDocument nesnesine dönüştürme
    QJsonDocument doc = QJsonDocument::fromJson(jsonData.toUtf8());

    // POST isteğini gönderme
    manager->post(request, doc.toJson());

    return true;
}

void EvKontrolPaneli::handleApiResponse(QNetworkReply *reply)
{
    QVariant statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute);
    if (reply->error() == QNetworkReply::NoError) {

        // İstek başarılı, yanıtı oku
        QByteArray responseData = reply->readAll();
        QString responseString(responseData);

        // Yanıtı konsola yazdır veya gerektiği şekilde işle
        //qDebug() << "Sunucu Yanıtı:" << responseString;
        emit apiResponseReceived(responseString, statusCode.toInt());
    } else {
        // Bir hata oluştu, hata mesajını yazdır
        qDebug() << "Hata:" << reply->errorString();
        emit apiResponseReceived("responseString", statusCode.toInt());
    }

    reply->deleteLater();
}

void EvKontrolPaneli::handleApiResponseAuth(QNetworkReply *reply)
{

}
