#ifndef CAT_H
#define CAT_H

#include <QObject>

class Cat : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
    QML_ELEMENT
public:
    explicit Cat(QObject *parent = nullptr);

signals:
    void nameChanged();

public slots:
    void changeName();

private:
    QString m_name;
    QString getName();
    void setName(QString value);
};

#endif // CAT_H
