#ifndef AYARLARSAYFASI_H
#define AYARLARSAYFASI_H

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
#include <QSettings>
class ayarlarSayfasi :public QObject
{
    Q_OBJECT
public:
    ayarlarSayfasi(QObject* parent = nullptr);
    ~ayarlarSayfasi();

    Q_INVOKABLE void ayarlarSayfasiVerileriKaydet(QString defaultApiUrl,QString defaultApiUserName,QString defaultApiPassword);

    QSettings settings;
};

#endif // AYARLARSAYFASI_H
