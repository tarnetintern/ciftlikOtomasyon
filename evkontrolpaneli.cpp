#include "evkontrolpaneli.h"


EvKontrolPaneli::EvKontrolPaneli(QObject *parent) : QObject(parent)
    ,manager (new QNetworkAccessManager(this))
    ,managerAuth (new QNetworkAccessManager(this))
    ,timer(new QTimer(this))

{
    connect(manager, &QNetworkAccessManager::finished, this, &EvKontrolPaneli::handleApiResponse);

    // Timer'ı ayarlayın ve performGetRequest slot'una bağlayın
    //timer->setInterval(10000); // 10 saniye
    //connect(timer, &QTimer::timeout, this, &EvKontrolPaneli::performGetRequest);
    //timer->start();
}

EvKontrolPaneli::~EvKontrolPaneli()
{
    delete manager;
    delete managerAuth;
    delete timer;

}

void EvKontrolPaneli::performGetRequest()
{

    getData(requestUrl); // Burada URL'nizi belirtin
}

bool EvKontrolPaneli::getData(QString url)
{
    QUrl serviceUrl(url);
    QNetworkRequest request(serviceUrl);

    // GET isteğini başlat
    manager->get(request);

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
        qDebug() << "Sunucu Yanıtı:" << responseString;
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
