#include "reservation.h"

Reservation::Reservation(QObject *parent):
    QObject(parent)
{
    m_totalPrice=0;
   // m_flight->flightID()="qqq";
}
Flight& Reservation::flight(){
    return m_flight;
}
int Reservation::totalPrice(){
    return m_totalPrice;
}
void Reservation::setTotalPrice(const int &luggageNumber){
    //Flight flight;
    //m_totalPrice = flight.price() + 10*luggageNumber;
    if (m_totalPrice == m_flight.price()+10*luggageNumber)
        return;
     m_totalPrice = m_flight.price()+10*luggageNumber;
    emit priceChanged();
}

void Reservation::setFlight(Flight &flight){
    /*if(flight == m_flight) //operator overload
        return;*/
    m_flight.setFlightID(flight.flightID());
    m_flight.setArriveCity(flight.arriveCity());
    m_flight.setDepartureCity(flight.departureCity());
    m_flight.setPrice(flight.price());
    m_flight.setArriveTime(flight.arriveTime());
    m_flight.setDepartureTime(flight.departureTime());
    emit flightChanged();
}
Passenger& Reservation::passenger(){
    return m_passenger;
}
Seat& Reservation::seat(){
    return m_seat;
}
Luggage& Reservation::luggage(){
    return m_luggage;
}
void Reservation::setPassenger(Passenger &passenger){
    m_passenger.setPassengerID(passenger.passengerID());
    m_passenger.setPassengerMail(passenger.passengerMail());
    m_passenger.setPassengerName(passenger.passengerName());
    m_passenger.setPassengerGender(passenger.passengerGender());
    m_passenger.setPassengerMobile(passenger.passengerMobile());
    m_passenger.setPassengerPassport(passenger.passengerPassport());
    emit flightChanged();
}
void Reservation::setSeat(Seat &seat){
    m_seat.setSeatRank(seat.seatRank());
    m_seat.setSeatState(seat.seatState());
    emit seatChanged();
}
void Reservation::setLuggage(Luggage &luggage){
    m_luggage.setLuggageID(luggage.luggageID());
    m_luggage.setLuggageType(luggage.luggageType());
    emit luggageChanged();
}


