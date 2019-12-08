#ifndef FLIGHT_H
#define FLIGHT_H
#include <QObject>
#include <QString>

class Flight : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(QString flightID READ flightID WRITE setFlightID NOTIFY flightIDChanged)
    Q_PROPERTY(QString departureCity READ departureCity WRITE setDepartureCity NOTIFY departureCityChanged)
    Q_PROPERTY(QString departureTime READ departureTime WRITE setDepartureTime NOTIFY departureTimeChanged)
    Q_PROPERTY(QString arriveCity READ arriveCity WRITE setArriveCity NOTIFY arriveCityChanged)
    Q_PROPERTY(QString arriveTime READ arriveTime WRITE setArriveTime NOTIFY arriveTimeChanged)
    Q_PROPERTY(int capacity READ capacity WRITE setCapacity NOTIFY capacityChanged)
    Q_PROPERTY(int price READ price WRITE setPrice NOTIFY priceChanged)
    Q_PROPERTY(int occupancy READ occupancy WRITE setOccupancy NOTIFY occupancyChanged)

public:
    explicit Flight(QObject *parent = nullptr);

    QString flightID();
    int price();
    QString departureCity();
    QString departureTime();
    QString arriveCity();
    QString arriveTime();
    int capacity();
    int occupancy();
    void setOccupancy(const int &occupancy);
    void setFlightID(const QString &flightID);
    void setPrice(const int &price);
    void setDepartureCity(const QString &departureCity);
    void setDepartureTime(const QString &departureTime);
    void setArriveCity(const QString &arriveCity);
    void setArriveTime(const QString &arriveTime);
    void setCapacity(const int &capacity);

signals:
    void occupancyChanged();
    void flightIDChanged();
    void departureCityChanged();
    void departureTimeChanged();
    void priceChanged();
    void arriveCityChanged();
    void arriveTimeChanged();
    void capacityChanged();
    void demoSignal();

protected:
    QString m_flightID;
    QString m_departureCity;
    QString m_departureTime;
    QString m_arriveCity;
    QString m_arriveTime;
    int m_capacity;
    int m_occupancy;
    int m_price;

public slots:
void emitTheSignal(){
    emit demoSignal();
}
};
#endif // FLIGHT_H
