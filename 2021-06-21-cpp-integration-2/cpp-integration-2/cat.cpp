#include "cat.h"

Cat::Cat(QObject *parent) : QObject(parent)
{

}


void Cat::meow()
{
    emit meowed();
}

void Cat::changeName(QString name)
{
    setName(name);
    nameChanged();
}

QString Cat::getName()
{
    return m_name;
}

void Cat::setName(QString value)
{
    m_name = value;
}
