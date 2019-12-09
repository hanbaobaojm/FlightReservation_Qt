#include "reservationData.h"

ReservationData::ReservationData(QObject *parent):
    QObject(parent)
{
    m_passengerID = 0;
    m_passengerName = "Bob";
    m_passengerMobile = "123456";
    m_passengerMail = "Bob@user.com";
    m_passengerPassport = "A101101";
    m_passengerGender = "Male";
    m_flightID = "OS722";
    m_departureCity = "Budapest";
    m_departureTime = "18:40";
    m_arriveCity = "Vienna";
    m_arriveTime = "19:30";
    m_price = 100;
    m_luggageNumber = 0;
    m_seatNumber = "21A";
}
int ReservationData::passengerID(){
    return m_passengerID;
}
QString ReservationData::passengerName(){
    return m_passengerName;
}
QString ReservationData::passengerMobile(){
    return m_passengerMobile;
}
QString ReservationData::passengerMail(){
    return m_passengerMail;
}
QString ReservationData::passengerPassport(){
    return m_passengerPassport;
}
QString ReservationData::passengerGender(){
    return m_passengerGender;
}
void ReservationData::setPassengerID(const int &passengerID){
    if (passengerID == m_passengerID)
        return;

    m_passengerID = passengerID;
    emit passengerIDChanged();
}
void ReservationData::setPassengerName(const QString &passengerName){
    if (passengerName == m_passengerName)
        return;

    m_passengerName = passengerName;
    emit passengerNameChanged();
}
void ReservationData::setPassengerMobile(const QString &passengerMobile){
    if (passengerMobile == m_passengerMobile)
        return;

    m_passengerMobile = passengerMobile;
    emit passengerMobileChanged();
}
void ReservationData::setPassengerMail(const QString &passengerMail){
    if (passengerMail == m_passengerMail)
        return;

    m_passengerMail = passengerMail;
    emit passengerMailChanged();
}
void ReservationData::setPassengerPassport(const QString &passengerPassport){
    if (passengerPassport == m_passengerPassport)
        return;

    m_passengerPassport = passengerPassport;
    emit passengerPassportChanged();
}
void ReservationData::setPassengerGender(const QString &passengerGender){
    if (passengerGender == m_passengerGender)
        return;

    m_passengerGender = passengerGender;
    emit passengerGenderChanged();
}
QString ReservationData::flightID(){
    return m_flightID;
}
int ReservationData::price(){
    return m_price;
}
QString ReservationData::departureCity(){
    return m_departureCity;
}
QString ReservationData::departureTime(){
    return m_departureTime;
}
QString ReservationData::arriveCity(){
    return m_arriveCity;
}
QString ReservationData::arriveTime(){
    return m_arriveTime;
}

void ReservationData::setFlightID(const QString &flightID){
    if (flightID == m_flightID)
        return;

    m_flightID = flightID;
    emit flightIDChanged();
}
void ReservationData::setPrice(const int &price){
    if(price == m_price)
        return;
    m_price = price;
    emit priceChanged();
}
void ReservationData::setDepartureCity(const QString &departureCity){
    if(departureCity == m_departureCity)
        return;
    m_departureCity = departureCity;
    emit departureCityChanged();
}
void ReservationData::setDepartureTime(const QString &departureTime){
    if(departureTime == m_departureTime)
        return;
    m_departureTime = departureTime;
    emit departureTimeChanged();
}
void ReservationData::setArriveCity(const QString &arriveCity){
    if(arriveCity == m_arriveCity)
        return;
    m_arriveCity = arriveCity;
    emit arriveCityChanged();
}
void ReservationData::setArriveTime(const QString &arriveTime){
    if(arriveTime == m_arriveTime)
        return;
    m_arriveTime = arriveTime;
    emit arriveTimeChanged();
}
int ReservationData::luggageNumber(){
    return m_luggageNumber;
}
QString ReservationData::seatNumber(){
    return m_seatNumber;
}
void ReservationData::setLuggageNumber(const int &luggageNumber){
    if(luggageNumber == m_luggageNumber)
        return;
    m_luggageNumber = luggageNumber;
    emit luggageNumberChanged();
}
void ReservationData::setSeatNumber(const QString &seatNumber){
    if(seatNumber == m_seatNumber)
        return;
    m_seatNumber = seatNumber;
    emit seatNumberChanged();
}

