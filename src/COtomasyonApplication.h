#include<QApplication>
#include <QTimer>
#include <QElapsedTimer>
#include <QMap>
#include <QSet>
#include <QMetaMethod>
#include <QMetaObject>
#include <QGuiApplication>




class COtomasyonApplication : public QApplication
{
    Q_OBJECT
public:
    COtomasyonApplication(int &argc, char* argv[]);
    ~COtomasyonApplication();


    static COtomasyonApplication*  _app;

    void initCommon(COtomasyonApplication &app);


};
COtomasyonApplication* qgcApp(void);
