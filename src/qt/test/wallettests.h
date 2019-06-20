#ifndef BITCOINRUSH_QT_TEST_WALLETTESTS_H
#define BITCOINRUSH_QT_TEST_WALLETTESTS_H

#include <QObject>
#include <QTest>

class WalletTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void walletTests();
};

#endif // BITCOINRUSH_QT_TEST_WALLETTESTS_H
