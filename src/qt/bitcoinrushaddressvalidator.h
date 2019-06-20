// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOINRUSH_QT_BITCOINRUSHADDRESSVALIDATOR_H
#define BITCOINRUSH_QT_BITCOINRUSHADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BitcoinrushAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinrushAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Bitcoinrush address widget validator, checks for a valid bitcoinrush address.
 */
class BitcoinrushAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BitcoinrushAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BITCOINRUSH_QT_BITCOINRUSHADDRESSVALIDATOR_H
