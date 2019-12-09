#include "seat.h"

Seat::Seat(QObject *parent):
    QObject(parent)
{
    m_seatID = 0;
    m_seatState = true;
    m_seatRank = 0;
}
Seat::Seat(const Seat &f){
    m_seatID = f.m_seatID;
    m_seatRank = f.m_seatRank;
    m_seatState = f.m_seatState;
}
Seat& Seat:: operator = (const Seat & f){
    m_seatID = f.m_seatID;
    m_seatRank = f.m_seatRank;
    m_seatState = f.m_seatState;
}

int Seat::seatID(){
    return m_seatID;
}
bool Seat::seatState(){
    return m_seatState;
}
int Seat::seatRank(){
    return m_seatRank;
}
void Seat::setSeatState(const bool &seatState){
    if (seatState == m_seatState)
        return;

    m_seatState = seatState;
    emit seatStateChanged();
}
void Seat::setSeatRank(const int &seatRank){
    if (seatRank == m_seatRank)
        return;

    m_seatRank = seatRank;
    emit seatRankChanged();
}
