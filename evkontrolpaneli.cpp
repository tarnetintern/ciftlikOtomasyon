#include "evkontrolpaneli.h"

EvKontrolPaneli::EvKontrolPaneli(QObject *parent) : QObject(parent)
    ,manager (new QNetworkAccessManager(this))
    ,managerAuth (new QNetworkAccessManager(this))
{
    connect(manager, &QNetworkAccessManager::finished, this, &EvKontrolPaneli::handleApiResponse);
    connect(managerAuth, &QNetworkAccessManager::finished, this, &EvKontrolPaneli::handleApiResponseAuth);

}

EvKontrolPaneli::~EvKontrolPaneli()
{
    delete manager;
    delete managerAuth;

}
