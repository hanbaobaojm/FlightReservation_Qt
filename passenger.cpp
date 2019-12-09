#include "passenger.h"

Passenger::Passenger(QObject *parent):
    QObject(parent)
{
    m_passengerID = 0;
    m_passengerName = "Bob";
    m_passengerMobile = "123456";
    m_passengerMail = "Bob@user.com";
    m_passengerPassport = "A101101";
    m_passengerGender = true;
}
Passenger::Passenger(const Passenger &f){
    m_passengerID = f.m_passengerID;
    m_passengerName = f.m_passengerName;
    m_passengerMobile = f.m_passengerMobile;
    m_passengerMail = f.m_passengerMail;
    m_passengerPassport = f.m_passengerPassport;
    m_passengerGender = f.m_passengerGender;
}
Passenger & Passenger::operator = (const Passenger & f){
    m_passengerID = f.m_passengerID;
    m_passengerName = f.m_passengerName;
    m_passengerMobile = f.m_passengerMobile;
    m_passengerMail = f.m_passengerMail;
    m_passengerPassport = f.m_passengerPassport;
    m_passengerGender = f.m_passengerGender;
}
int Passenger::passengerID(){
    return m_passengerID;
}
QString Passenger::passengerName(){
    return m_passengerName;
}
QString Passenger::passengerMobile(){
    return m_passengerMobile;
}
QString Passenger::passengerMail(){
    return m_passengerMail;
}
QString Passenger::passengerPassport(){
    return m_passengerPassport;
}
bool Passenger::passengerGender(){
    return m_passengerGender;
}
void Passenger::setPassengerID(const int &passengerID){
    if (passengerID == m_passengerID)
        return;

    m_passengerID = passengerID;
    emit passengerIDChanged();
}
void Passenger::setPassengerName(const QString &passengerName){
    if (passengerName == m_passengerName)
        return;

    m_passengerName = passengerName;
    emit passengerNameChanged();
}
void Passenger::setPassengerMobile(const QString &passengerMobile){
    if (passengerMobile == m_passengerMobile)
        return;

    m_passengerMobile = passengerMobile;
    emit passengerMobileChanged();
}
void Passenger::setPassengerMail(const QString &passengerMail){
    if (passengerMail == m_passengerMail)
        return;

    m_passengerMail = passengerMail;
    emit passengerMailChanged();
}
void Passenger::setPassengerPassport(const QString &passengerPassport){
    if (passengerPassport == m_passengerPassport)
        return;

    m_passengerPassport = passengerPassport;
    emit passengerPassportChanged();
}
void Passenger::setPassengerGender(const bool &passengerGender){
    if (passengerGender == m_passengerGender)
        return;

    m_passengerGender = passengerGender;
    emit passengerGenderChanged();
}
