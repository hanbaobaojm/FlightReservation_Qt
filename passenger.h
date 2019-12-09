#ifndef PASSENGER_H
#define PASSENGER_H
#include <QObject>
#include <QString>

class Passenger : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(int passengerID READ passengerID WRITE setPassengerID NOTIFY passengerIDChanged)
    Q_PROPERTY(QString passengerName READ passengerName WRITE setPassengerName NOTIFY passengerNameChanged)
    Q_PROPERTY(QString passengerMobile READ passengerMobile WRITE setPassengerMobile NOTIFY passengerMobileChanged)
    Q_PROPERTY(QString passengerMail READ passengerMail WRITE setPassengerMail NOTIFY passengerMailChanged)
    Q_PROPERTY(QString passengerPassport READ passengerPassport WRITE setPassengerPassport NOTIFY passengerPassportChanged)
    Q_PROPERTY(bool passengerGender READ passengerGender WRITE setPassengerGender NOTIFY passengerGenderChanged)

public:
    explicit Passenger(QObject *parent = nullptr);

    Passenger(const Passenger &f);
    Passenger & operator = (const Passenger & RightSides);

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

signals:
    void passengerIDChanged();
    void passengerNameChanged();
    void passengerMobileChanged();
    void passengerMailChanged();
    void passengerPassportChanged();
    void passengerGenderChanged();

private:
    int m_passengerID;
    QString m_passengerName;
    QString m_passengerMobile;
    QString m_passengerMail;
    QString m_passengerPassport;
    bool m_passengerGender;
};
#endif // PASSENGER_H
