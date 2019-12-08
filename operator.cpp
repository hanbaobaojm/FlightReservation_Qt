#include "operator.h"
#include <QDebug>

Operator::Operator(QObject *parent) :
    QObject(parent)
{
    m_userName = "user1";
    m_passWord = "1111";
}

QString Operator::userName()
{
    return m_userName;
}
QString Operator::passWord()
{
    return m_passWord;
}
void Operator::setUserName(const QString &userName)
{
    if (userName == m_userName)
        return;

    m_userName = userName;
    emit userNameChanged();
}
void Operator::setPassWord(const QString &passWord)
{
    if (passWord == m_passWord)
        return;

    m_passWord = passWord;
    emit passWordChanged();
}

