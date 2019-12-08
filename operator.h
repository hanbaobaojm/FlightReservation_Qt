#ifndef OPERATOR_H
#define OPERATOR_H

#include <QObject>
#include <QString>

class Operator : public QObject
{
    Q_OBJECT
    //所有能访问的属性必须通过Q_PROPERTY声明
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString passWord READ passWord WRITE setPassWord NOTIFY passWordChanged)

public:
    explicit Operator(QObject *parent = nullptr);

    QString userName();
    QString passWord();
    void setUserName(const QString &userName);
    void setPassWord(const QString &passWord);

signals:
    void userNameChanged();
    void passWordChanged();

private:
    QString m_userName;
    QString m_passWord;
};

#endif // OPERATOR_H

