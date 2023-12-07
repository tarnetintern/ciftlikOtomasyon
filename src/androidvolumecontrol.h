#ifndef ANDROIDVOLUMECONTROL_H
#define ANDROIDVOLUMECONTROL_H

#ifdef Q_OS_ANDROID
#include <QtAndroid>

#include <QAndroidJniObject>
#include <QDebug>

class androidVolumeControl
{
public:
    androidVolumeControl();

    static void setVolume(int level) {
        // Java sınıfınızın tam yolunu sağlayın
        QAndroidJniObject javaVolumeControl("C:/Users/Hp/Desktop/ders/otomasyonCiftlik/ciftlikOtomasyon/android/src/org/ciftlikOtomasyon/VolumeControl");

        // Java sınıfınızın bir instance'ını yaratın
        if (javaVolumeControl.isValid()) {
            // 'setVolume' metodunu çağırın
            javaVolumeControl.callMethod<void>("setVolume", "(I)V", level);
        } else {
            qDebug() << "Java VolumeControl sınıfı geçerli değil!";
        }
    }

    static int getVolume() {
        QAndroidJniObject javaVolumeControl("C:/Users/Hp/Desktop/ders/otomasyonCiftlik/ciftlikOtomasyon/android/src/org/ciftlikOtomasyon/VolumeControl");

        if (javaVolumeControl.isValid()) {
            // 'getVolume' metodunu çağırın ve sonucu döndürün
            return javaVolumeControl.callMethod<jint>("getVolume");
        } else {
            qDebug() << "Java VolumeControl sınıfı geçerli değil!";
            return -1;
        }
    }

};
#endif // Q_OS_ANDROID
#endif // ANDROIDVOLUMECONTROL_H
