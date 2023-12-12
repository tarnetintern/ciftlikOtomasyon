#ifndef EVKONTROLPANELI_H
#define EVKONTROLPANELI_H
#include <QApplication>
#include <QTimer>
#include <QElapsedTimer>
#include <QMap>
#include <QSet>
#include <QMetaMethod>
#include <QMetaObject>
#include <QGuiApplication>
#include <QQuickItem>

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QFile>
#include <QUrl>

#include <QJsonDocument>
#include <QJsonObject>

class EvKontrolPaneli :public QObject
{

    Q_OBJECT

public:

    EvKontrolPaneli(QObject* parent = nullptr);
    ~EvKontrolPaneli();

    Q_INVOKABLE bool baglanAuth(QString url,QString port,QString kullaniciAdi,QString sifre);
    Q_INVOKABLE bool baglan(QString url,QString port);

    Q_INVOKABLE bool baglantiyiKes();
    Q_INVOKABLE bool baglantiyiKesAuth();

    Q_INVOKABLE bool baglantiyiKontrolEt();
    Q_INVOKABLE bool baglantiyiKontrolEtAuth();

    Q_INVOKABLE bool postData(QString url,QString jsonData);
    Q_INVOKABLE bool postDataAuth(QString url,QString jsonData,QString kullaniciAdi,QString sifre);
    bool getData(QString url);




    void handleApiResponse(QNetworkReply *reply);
    void handleApiResponseAuth(QNetworkReply *reply);

private slots:
    void performGetRequest();  // Yeni slot

private:
    QNetworkAccessManager *manager;
    QNetworkAccessManager *managerAuth;
    QTimer *timer;             // QTimer nesnesi
    QString requestUrl="http://77.245.158.70:7171/todo";        // GET isteği yapılacak URL

signals:
    void apiResponseReceived(QString response,int statusCode);

};

#endif // EVKONTROLPANELI_H
