#ifndef RESERVATION_H
#define RESERVATION_H
#include <QObject>
#include <QString>
#include "flight.h"
#include "passenger.h"
#include "luggage.h"
#include "seat.h"

class Reservation :  public QObject
{
    Q_OBJECT
    Q_PROPERTY(int luggageNumber )
    Q_PROPERTY(Flight flight READ flight WRITE setFlight NOTIFY flightChanged)
    Q_PROPERTY(Passenger passenger READ passenger WRITE setPassenger NOTIFY passengerChanged)
    Q_PROPERTY(Luggage luggage READ luggage WRITE setLuggage NOTIFY luggageChanged)
    Q_PROPERTY(Seat seat READ seat WRITE setSeat NOTIFY seatChanged)
    Q_PROPERTY(int totalPrice READ totalPrice WRITE setTotalPrice NOTIFY priceChanged)
public:
    explicit Reservation(QObject *parent = nullptr);
    int totalPrice();
    Flight &flight();
    Passenger &passenger();
    Seat &seat();
    Luggage &luggage();
    Q_INVOKABLE void setPassenger(Passenger &passenger);
    Q_INVOKABLE void setSeat(Seat &seat);
    Q_INVOKABLE void setLuggage(Luggage &luggage);
    Q_INVOKABLE void setTotalPrice(const int &luggageNumber);
    Q_INVOKABLE void setFlight(Flight &flight);

signals:
    void priceChanged();
    void flightChanged();
    void seatChanged();
    void luggageChanged();
    void passengerChanged();
    void demoSignal();

private:
    int m_totalPrice;
    int m_luggageNumber;
    Flight m_flight;
    Passenger m_passenger;
    Luggage m_luggage;
    Seat m_seat;


public slots:
void emitTheSignal(){
    emit demoSignal();
}
};

#endif // RESERVATION_H
