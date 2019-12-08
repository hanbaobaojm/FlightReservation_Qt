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
    Q_PROPERTY(bool passengerGender READ passengerGender WRITE setPassengerGender NOTIFY passengerGenderChanged)
    Q_PROPERTY(int luggageNumber READ luggageNumber WRITE setLuggageNumber NOTIFY luggageNumberChanged)
    Q_PROPERTY(int seatNumber READ seatNumber WRITE setSeatNumber NOTIFY seatNumberChanged)

public:
    explicit ReservationData(QObject *parent = nullptr);

    QString flightID();
    int price();
    QString departureCity();
    QString departureTime();
    QString arriveCity();
    QString arriveTime();
    void setFlightID(const QString &flightID);
    void setPrice(const int &price);
    void setDepartureCity(const QString &departureCity);
    void setDepartureTime(const QString &departureTime);
    void setArriveCity(const QString &arriveCity);
    void setArriveTime(const QString &arriveTime);
    int passengerID();
    QString passengerName();
    QString passengerMobile();
    QString passengerMail();
    QString passengerPassport();
    bool passengerGender();
    void setPassengerID(const int &passengerID);
    void setPassengerName(const QString &passengerName);
    void setPassengerMobile(const QString &passengerMobile);
    void setPassengerMail(const QString &passengerMail);
    void setPassengerPassport(const QString &passengerPassport);
    void setPassengerGender(const bool &passengerGender);
    int luggageNumber();
    int seatNumber();
    void setLuggageNumber(const int &luggageNumber);
    void setSeatNumber(const int &seatNumber);

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
    bool m_passengerGender;
    int m_luggageNumber;
    int m_seatNumber;
};
#endif // RESERVATIONDATA_H
