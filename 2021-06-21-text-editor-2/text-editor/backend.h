#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QFileInfo>
#include <QFile>
#include <QDataStream>
#include <QDebug>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString path READ getPath WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString data READ getData WRITE setData NOTIFY dataChanged)

public:
    explicit Backend(QObject *parent = nullptr);
    QString getPath();
    void setPath(QString value);
    QString getData();
    void setData(QString value);

signals:
    void pathChanged();
    void dataChanged();

private:
    QString m_path;
};



#endif // BACKEND_H
