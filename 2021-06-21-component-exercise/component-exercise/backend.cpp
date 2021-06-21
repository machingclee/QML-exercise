#include "backend.h"

Backend::Backend(QObject *parent) : QObject(parent)
{

}

QString Backend::getPath()
{
    return m_path;
}

void Backend::setPath(QString value)
{
    m_path = value;
    m_path.remove("file://");
    emit pathChanged();
}

QString Backend::getData()
{
    QFile file(m_path);

    if(!file.open(QIODevice::ReadOnly)){
        qWarning() << "Cannot open the file";
    }

    QTextStream stream (&file);

    QString value = stream.readAll();
    file.close();

    return value;
}

void Backend::setData(QString value)
{
    QFile file(m_path);

    if(!file.open(QIODevice::WriteOnly)){
        qWarning() << "Cannot write the file";
    }

    QTextStream stream (&file);
    stream << value;
    stream.flush();
    file.close();

    emit dataChanged();
}
