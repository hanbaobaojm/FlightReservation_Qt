#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "operator.h"
#include "flight.h"
#include "reservation.h"
#include "reservationData.h"
#include <QObject>
#include <QMetaObject>
#include <QQmlContext>
#include <iostream>
using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<Operator>("io.qt.examples",1,0,"Operator");
    qmlRegisterType<Flight>("io.qt.examples",1,0,"Flight");
    //qmlRegisterType<Reservation>("io.qt.examples",1,0,"Reservation");
    qmlRegisterType<ReservationData>("io.qt.examples",1,0,"ReservationData");

    QGuiApplication app(argc, argv);

    qRegisterMetaType<Flight>("Flight");
    qRegisterMetaType<Flight>("Flight&");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    Flight *f1 = new Flight();
    f1->setFlightID("SWR2255");
    f1->setDepartureCity("Budapest");
    f1->setDepartureTime("14:48 CET");
    f1->setArriveCity("Zurich");
    f1->setArriveTime("16:24 CET");
    f1->setPrice(115);
    f1->setCapacity(150);
    f1->setOccupancy(130);
    engine.rootContext()->setContextProperty("f1",f1);
    f1->emitTheSignal();
    Flight *f2 = new Flight();
    f2->setFlightID("OS833");
    f2->setDepartureCity("Budapest");
    f2->setDepartureTime("10:48 CET");
    f2->setArriveCity("Vienna");
    f2->setArriveTime("11:24 CET");
    f2->setPrice(80);
    f2->setCapacity(50);
    f2->setOccupancy(5);
    engine.rootContext()->setContextProperty("f2",f2);
    f2->emitTheSignal();
    Flight *f3 = new Flight();
    f3->setFlightID("OS722");
    f3->setDepartureCity("Budapest");
    f3->setDepartureTime("18:40 CET");
    f3->setArriveCity("Vienna");
    f3->setArriveTime("19:30 CET");
    f3->setCapacity(50);
    f3->setOccupancy(1);
    f3->setPrice(100);
    engine.rootContext()->setContextProperty("f3",f3);
    f3->emitTheSignal();
    Reservation *R1 = new Reservation();
    R1->setFlight(*f1);
    //int a = R1->flight().price();
    engine.rootContext()->setContextProperty("R1",R1);
    R1->emitTheSignal();
    return app.exec();
}

