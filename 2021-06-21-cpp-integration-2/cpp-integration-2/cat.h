#ifndef CAT_H
#define CAT_H

#include <QObject>


class Cat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)

public:
    explicit Cat(QObject *parent = nullptr);

signals:
    void meowed();
    void nameChanged();

public slots:
    void meow();
    void changeName(QString data);

private:
    QString m_name;
    QString getName();
    void setName(QString value);

};

#endif // CAT_H
