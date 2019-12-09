#ifndef RESERVATIONDATA_H
#define RESERVATIONDATA_H
#include <QObject>
#include <QString>
class ReservationData : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(QString flightID READ flightID WRITE setFlightID NOTIFY flightIDChanged)
    Q_PROPERTY(QString departureCity READ departureCity WRITE setDepartureCity NOTIFY departureCityChanged)
    Q_PROPERTY(QString departureTime READ departureTime WRITE setDepartureTime NOTIFY departureTimeChanged)
    Q_PROPERTY(QString arriveCity READ arriveCity WRITE setArriveCity NOTIFY arriveCityChanged)
    Q_PROPERTY(QString arriveTime READ arriveTime WRITE setArriveTime NOTIFY arriveTimeChanged)
    Q_PROPERTY(int price READ price WRITE setPrice NOTIFY priceChanged)
    Q_PROPERTY(int passengerID READ passengerID WRITE setPassengerID NOTIFY passengerIDChanged)
    Q_PROPERTY(QString passengerName READ passengerName WRITE setPassengerName NOTIFY passengerNameChanged)
    Q_PROPERTY(QString passengerMobile READ passengerMobile WRITE setPassengerMobile NOTIFY passengerMobileChanged)
    Q_PROPERTY(QString passengerMail READ passengerMail WRITE setPassengerMail NOTIFY passengerMailChanged)
    Q_PROPERTY(QString passengerPassport READ passengerPassport WRITE setPassengerPassport NOTIFY passengerPassportChanged)
    Q_PROPERTY(QString passengerGender READ passengerGender WRITE setPassengerGender NOTIFY passengerGenderChanged)
    Q_PROPERTY(int luggageNumber READ luggageNumber WRITE setLuggageNumber NOTIFY luggageNumberChanged)
    Q_PROPERTY(QString seatNumber READ seatNumber WRITE setSeatNumber NOTIFY seatNumberChanged)

public:
    explicit ReservationData(QObject *parent = nullptr);

    QString flightID();
    int price();
    QString departureCity();
    QString departureTime();
    QString arriveCity();
    QString arriveTime();
    Q_INVOKABLE void setFlightID(const QString &flightID);
    Q_INVOKABLE void setPrice(const int &price);
    Q_INVOKABLE void setDepartureCity(const QString &departureCity);
    Q_INVOKABLE void setDepartureTime(const QString &departureTime);
    Q_INVOKABLE void setArriveCity(const QString &arriveCity);
    Q_INVOKABLE void setArriveTime(const QString &arriveTime);
    int passengerID();
    QString passengerName();
    QString passengerMobile();
    QString passengerMail();
    QString passengerPassport();
    QString passengerGender();
    Q_INVOKABLE void setPassengerID(const int &passengerID);
    Q_INVOKABLE void setPassengerName(const QString &passengerName);
    Q_INVOKABLE void setPassengerMobile(const QString &passengerMobile);
    Q_INVOKABLE void setPassengerMail(const QString &passengerMail);
    Q_INVOKABLE void setPassengerPassport(const QString &passengerPassport);
    Q_INVOKABLE void setPassengerGender(const QString &passengerGender);
    int luggageNumber();
    QString seatNumber();
    Q_INVOKABLE void setLuggageNumber(const int &luggageNumber);
    Q_INVOKABLE void setSeatNumber(const QString &seatNumber);

signals:
    void flightIDChanged();
    void departureCityChanged();
    void departureTimeChanged();
    void priceChanged();
    void arriveCityChanged();
    void arriveTimeChanged();
    void demoSignal();
    void passengerIDChanged();
    void passengerNameChanged();
    void passengerMobileChanged();
    void passengerMailChanged();
    void passengerPassportChanged();
    void passengerGenderChanged();
    void seatNumberChanged();
    void luggageNumberChanged();

private:
    QString m_flightID;
    QString m_departureCity;
    QString m_departureTime;
    QString m_arriveCity;
    QString m_arriveTime;
    int m_price;
    int m_passengerID;
    QString m_passengerName;
    QString m_passengerMobile;
    QString m_passengerMail;
    QString m_passengerPassport;
    QString m_passengerGender;
    int m_luggageNumber;
    QString m_seatNumber;
};
#endif // RESERVATIONDATA_H
