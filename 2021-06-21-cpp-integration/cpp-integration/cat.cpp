#include "cat.h"

Cat::Cat(QObject *parent) : QObject(parent)
{

}

void Cat::changeName()
{

}

QString Cat::getName()
{
    return m_name;
}

void Cat::setName(QString value)
{
    m_name = value;
}
