#include "bluetooth.h"
#include <QDebug>

Bluetooth::Bluetooth(QObject *parent) : QObject(parent)
{
    discoveryAgent = new QBluetoothDeviceDiscoveryAgent(this);

    connect(discoveryAgent, &QBluetoothDeviceDiscoveryAgent::deviceDiscovered,
            this, &Bluetooth::deviceDiscovered);
    connect(discoveryAgent, &QBluetoothDeviceDiscoveryAgent::finished,
            this, &Bluetooth::scanFinished);
}

void Bluetooth::startScan()
{
    discoveryAgent->start();
    qDebug() << "Scanning for Bluetooth devices...";
}

void Bluetooth::bluetoothAc()
{
    QBluetoothDeviceDiscoveryAgent *discoveryAgent = new QBluetoothDeviceDiscoveryAgent(this);
    connect(discoveryAgent, &QBluetoothDeviceDiscoveryAgent::deviceDiscovered,
            this, &Bluetooth::deviceDiscovered);
    discoveryAgent->start();
}

void Bluetooth::addDevice(QString device)
{
    m_deviceList.append(device);

    emit deviceListChanged(device);
}

void Bluetooth::deviceDiscovered(const QBluetoothDeviceInfo &device)
{
    //qDebug() << "Found new device:" << device.name() << '(' << device.address().toString() << ')';
    addDevice(device.name());
}

void Bluetooth::scanFinished()
{
    qDebug() << "Bluetooth device scan finished.";
}
