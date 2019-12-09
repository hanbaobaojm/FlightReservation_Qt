/*#ifndef FLIGHTMANAGER_H
#define FLIGHTMANAGER_H
#include <QObject>
#include <QString>
#include <QList>
#include "flight.h"

class FlightManager : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(QList<Flight> result READ result WRITE search NOTIFY resultChanged)

public:
    explicit FlightManager(QObject *parent = nullptr);
    QList<Flight> &result();
    void search(Flight &f1,Flight &f2,Flight &f3, QString arr, QString dep, int number);
signals:
    void resultChanged();
private:
    QList<Flight> m_result;
};
#endif // FLIGHTMANAGER_H
*/
