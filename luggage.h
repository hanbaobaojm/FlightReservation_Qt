#ifndef LUGGAGE_H
#define LUGGAGE_H
#include <QObject>
#include <QString>

class Luggage : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(int luggageID READ luggageID WRITE setLuggageID NOTIFY luggageIDChanged)
    Q_PROPERTY(int luggageType READ luggageType WRITE setLuggageType NOTIFY luggageTypeChanged)

public:
    explicit Luggage(QObject *parent = nullptr);

    Luggage(const Luggage &f);
    Luggage & operator = (const Luggage & RightSides);
    int luggageID();
    int luggageType();
    void setLuggageID(const int &luggageID);
    void setLuggageType(const int &luggageType);

signals:
    void luggageIDChanged();
    void luggageTypeChanged();

private:
    int m_luggageID;
    int m_luggageType;
};

#endif // LUGGAGE_H
