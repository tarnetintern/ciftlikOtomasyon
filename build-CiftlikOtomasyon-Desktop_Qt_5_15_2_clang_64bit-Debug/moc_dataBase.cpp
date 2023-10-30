/****************************************************************************
** Meta object code from reading C++ file 'dataBase.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../src/dataBase.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dataBase.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_DataBase_t {
    QByteArrayData data[20];
    char stringdata0[270];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DataBase_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DataBase_t qt_meta_stringdata_DataBase = {
    {
QT_MOC_LITERAL(0, 0, 8), // "DataBase"
QT_MOC_LITERAL(1, 9, 19), // "veriTabaniniOlustur"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 11), // "setHostName"
QT_MOC_LITERAL(4, 42, 15), // "setDatabaseName"
QT_MOC_LITERAL(5, 58, 11), // "setUserName"
QT_MOC_LITERAL(6, 70, 11), // "setPassword"
QT_MOC_LITERAL(7, 82, 16), // "tablolariOlustur"
QT_MOC_LITERAL(8, 99, 19), // "veriTabaniKayitEkle"
QT_MOC_LITERAL(9, 119, 10), // "hayvanTuru"
QT_MOC_LITERAL(10, 130, 9), // "hayvanAdi"
QT_MOC_LITERAL(11, 140, 6), // "kupeNo"
QT_MOC_LITERAL(12, 147, 11), // "dogumTarihi"
QT_MOC_LITERAL(13, 159, 10), // "olumTarihi"
QT_MOC_LITERAL(14, 170, 11), // "yavruSayisi"
QT_MOC_LITERAL(15, 182, 10), // "anneKupeNo"
QT_MOC_LITERAL(16, 193, 10), // "babaKupeNo"
QT_MOC_LITERAL(17, 204, 18), // "veriTabaniKayitSil"
QT_MOC_LITERAL(18, 223, 22), // "veriTabaniSorgulamaYap"
QT_MOC_LITERAL(19, 246, 23) // "veriTabaniGuncellemeYap"

    },
    "DataBase\0veriTabaniniOlustur\0\0setHostName\0"
    "setDatabaseName\0setUserName\0setPassword\0"
    "tablolariOlustur\0veriTabaniKayitEkle\0"
    "hayvanTuru\0hayvanAdi\0kupeNo\0dogumTarihi\0"
    "olumTarihi\0yavruSayisi\0anneKupeNo\0"
    "babaKupeNo\0veriTabaniKayitSil\0"
    "veriTabaniSorgulamaYap\0veriTabaniGuncellemeYap"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DataBase[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    4,   44,    2, 0x02 /* Public */,
       7,    0,   53,    2, 0x02 /* Public */,
       8,    8,   54,    2, 0x02 /* Public */,
      17,    0,   71,    2, 0x02 /* Public */,
      18,    1,   72,    2, 0x02 /* Public */,
      19,    8,   75,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    3,    4,    5,    6,
    QMetaType::Bool,
    QMetaType::Bool, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::QString, QMetaType::QString,    9,   10,   11,   12,   13,   14,   15,   16,
    QMetaType::Bool,
    QMetaType::QVariantList, QMetaType::QString,   11,
    QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::QString, QMetaType::QString,    9,   10,   11,   12,   13,   14,   15,   16,

       0        // eod
};

void DataBase::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<DataBase *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { bool _r = _t->veriTabaniniOlustur((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: { bool _r = _t->tablolariOlustur();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->veriTabaniKayitEkle((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< QString(*)>(_a[7])),(*reinterpret_cast< QString(*)>(_a[8])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->veriTabaniKayitSil();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { QVariantList _r = _t->veriTabaniSorgulamaYap((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        case 5: { QString _r = _t->veriTabaniGuncellemeYap((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< int(*)>(_a[6])),(*reinterpret_cast< QString(*)>(_a[7])),(*reinterpret_cast< QString(*)>(_a[8])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject DataBase::staticMetaObject = { {
    QMetaObject::SuperData::link<QQuickItem::staticMetaObject>(),
    qt_meta_stringdata_DataBase.data,
    qt_meta_data_DataBase,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *DataBase::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DataBase::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_DataBase.stringdata0))
        return static_cast<void*>(this);
    return QQuickItem::qt_metacast(_clname);
}

int DataBase::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
