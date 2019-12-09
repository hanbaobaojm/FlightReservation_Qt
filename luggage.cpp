#include "luggage.h"
#include <QDebug>

Luggage::Luggage(QObject *parent) :
    QObject(parent)
{
    m_luggageID = 0;
    m_luggageType = 1;
}
Luggage::Luggage(const Luggage &f){
    m_luggageID = f.m_luggageID;
    m_luggageType = f.m_luggageType;
}
Luggage & Luggage::operator = (const Luggage & f){
    m_luggageID = f.m_luggageID;
    m_luggageType = f.m_luggageType;
}
int Luggage::luggageID()
{
    return m_luggageID;
}
int Luggage::luggageType()
{
    return m_luggageType;
}
void Luggage::setLuggageID(const int &luggageID)
{
    if (luggageID == m_luggageID)
        return;

    m_luggageID = luggageID;
    emit luggageIDChanged();
}
void Luggage::setLuggageType(const int &luggageType)
{
    if (luggageType == m_luggageType)
        return;

    m_luggageType = luggageType;
    emit luggageTypeChanged();
}

