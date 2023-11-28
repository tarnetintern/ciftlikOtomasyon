#ifndef BLUETOOTH_H
#define BLUETOOTH_H

#include <QObject>
#include <QBluetoothDeviceDiscoveryAgent>
#include <QBluetoothSocket>
#include <QBluetoothTransferManager>
#include <QBluetoothTransferReply>
#include <QBluetoothDeviceInfo>
#include <QBluetoothLocalDevice>


class Bluetooth : public QObject  // QObject'tan türetiliyor
{
    Q_OBJECT  // Q_OBJECT makrosu eklendi


    Q_PROPERTY(QList<QString> deviceList READ deviceList NOTIFY deviceListChanged)

public:
    explicit Bluetooth(QObject *parent = nullptr);
    Q_INVOKABLE void startScan();
    void bluetoothAc();
    QList<QString> deviceList() const { return m_deviceList; }
    void addDevice(QString device);


private slots:

    void deviceDiscovered(const QBluetoothDeviceInfo &device);
    void scanFinished();

private:
    QBluetoothDeviceDiscoveryAgent *discoveryAgent;
    QList<QString> m_deviceList;

signals:
    void deviceListChanged(QString veri);





};

#endif // BLUETOOTH_H
