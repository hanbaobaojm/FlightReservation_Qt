#ifndef SEAT_H
#define SEAT_H
#include <QObject>
#include <QString>

class Seat : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(int seatID READ seatID)
    Q_PROPERTY(bool seatState READ seatState WRITE setSeatState NOTIFY seatStateChanged)
    Q_PROPERTY(int seatRank READ seatRank WRITE setSeatRank NOTIFY seatRankChanged)

public:
    explicit Seat(QObject *parent = nullptr);

    Seat(const Seat &f);
    Seat & operator = (const Seat & RightSides);
    int seatID();
    bool seatState();
    int seatRank();
    void setSeatState(const bool &seatState);
    void setSeatRank(const int &seatRank);

signals:
    void seatStateChanged();
    void seatRankChanged();

protected:
    int m_seatID;
    bool m_seatState;
    int m_seatRank;
};
#endif // SEAT_H
