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


class EvKontrolPaneli : QObject
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

    Q_INVOKABLE bool postData(QString url,QString data);
    Q_INVOKABLE bool getData(QString url);


    void handleApiResponse(QNetworkReply *reply);
    void handleApiResponseAuth(QNetworkReply *reply);


private:
    QNetworkAccessManager *manager;
    QNetworkAccessManager *managerAuth;

};

#endif // EVKONTROLPANELI_H
