#include "COtomasyonApplication.h"
#include "ScreenToolsController.h"
#include <QQmlApplicationEngine>

COtomasyonApplication::COtomasyonApplication(int &argc, char* argv[])
    : QApplication          (argc, argv)
{


}


COtomasyonApplication* COtomasyonApplication::_app = nullptr;

static QObject* screenToolsControllerSingletonFactory(QQmlEngine*, QJSEngine*)
{
    ScreenToolsController* screenToolsController = new ScreenToolsController;
    return screenToolsController;
}




COtomasyonApplication::~COtomasyonApplication()
{

}

void COtomasyonApplication::initCommon(COtomasyonApplication &app)
{



}
