/*#include "flightManager.h"
#include <QList>

FlightManager::FlightManager(QObject *parent):
    QObject(parent)
{

}
QList<Flight>& FlightManager::result(){
    return m_result;
}
void FlightManager::search(Flight &f1,Flight &f2,Flight &f3, QString arr, QString dep, int number){
    QList<Flight> *result = new QList<Flight>();
    if(f1.arriveCity()==arr&&f1.departureCity()==dep&&f1.capacity()<=number)
        result->append(f1);
    if(f2.arriveCity()==arr&&f2.departureCity()==dep&&f2.capacity()<=number)
        result->append(f2);
    if(f3.arriveCity()==arr&&f3.departureCity()==dep&&f3.capacity()<=number)
        result->append(f3);
    m_result=*result;
}*/
