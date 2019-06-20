#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

BITCOINRUSHD=${BITCOINRUSHD:-$BINDIR/bitcoinrushd}
BITCOINRUSHCLI=${BITCOINRUSHCLI:-$BINDIR/bitcoinrush-cli}
BITCOINRUSHTX=${BITCOINRUSHTX:-$BINDIR/bitcoinrush-tx}
BITCOINRUSHQT=${BITCOINRUSHQT:-$BINDIR/qt/bitcoinrush-qt}

[ ! -x $BITCOINRUSHD ] && echo "$BITCOINRUSHD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
RUSHVER=($($BITCOINRUSHCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for bitcoinrushd if --version-string is not set,
# but has different outcomes for bitcoinrush-qt and bitcoinrush-cli.
echo "[COPYRIGHT]" > footer.h2m
$BITCOINRUSHD --version | sed -n '1!p' >> footer.h2m

for cmd in $BITCOINRUSHD $BITCOINRUSHCLI $BITCOINRUSHTX $BITCOINRUSHQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${RUSHVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${RUSHVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
