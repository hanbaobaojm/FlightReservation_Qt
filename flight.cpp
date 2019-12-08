#include "flight.h"

Flight::Flight(QObject *parent):
    QObject(parent)
{
    m_flightID = "OS722";
    m_departureCity = "Budapest";
    m_departureTime = "18:40";
    m_arriveCity = "Vienna";
    m_arriveTime = "19:30";
    m_capacity = 50;
    m_occupancy = 49;
    m_price = 100;
}
QString Flight::flightID(){
    return m_flightID;
}
int Flight::price(){
    return m_price;
}
QString Flight::departureCity(){
    return m_departureCity;
}
QString Flight::departureTime(){
    return m_departureTime;
}
QString Flight::arriveCity(){
    return m_arriveCity;
}
QString Flight::arriveTime(){
    return m_arriveTime;
}
int Flight::capacity(){
    return m_capacity;
}
int Flight::occupancy(){
    return m_occupancy;
}
void Flight::setOccupancy(const int &occupancy){
    if (occupancy == m_occupancy)
        return;

    m_occupancy = occupancy;
    emit occupancyChanged();
}
void Flight::setFlightID(const QString &flightID){
    if (flightID == m_flightID)
        return;

    m_flightID = flightID;
    emit flightIDChanged();
}
void Flight::setPrice(const int &price){
    if(price == m_price)
        return;
    m_price = price;
    emit priceChanged();
}
void Flight::setDepartureCity(const QString &departureCity){
    if(departureCity == m_departureCity)
        return;
    m_departureCity = departureCity;
    emit departureCityChanged();
}
void Flight::setDepartureTime(const QString &departureTime){
    if(departureTime == m_departureTime)
        return;
    m_departureTime = departureTime;
    emit departureTimeChanged();
}
void Flight::setArriveCity(const QString &arriveCity){
    if(arriveCity == m_arriveCity)
        return;
    m_arriveCity = arriveCity;
    emit arriveCityChanged();
}
void Flight::setArriveTime(const QString &arriveTime){
    if(arriveTime == m_arriveTime)
        return;
    m_arriveTime = arriveTime;
    emit arriveTimeChanged();
}
void Flight::setCapacity(const int &capacity){
    if(capacity == m_capacity)
        return;
    m_capacity = capacity;
    emit capacityChanged();
}
