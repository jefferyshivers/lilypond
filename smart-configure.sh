#!/bin/sh

srcdir=${srcdir:-.}
set -ux

MAKEFILE_MD5=`find $srcdir -name GNUmakefile | grep -v '^./GNUmakefile$' | sort | md5sum | cut -b 1-32`
CONFIGURE_INPUT_MD5=`cat $srcdir/config.make.in $srcdir/config.hh.in $srcdir/GNUmakefile.in | md5sum | cut -b 1-32`
CONFIGURE_OPTIONS_MD5=`echo "$@" | tr ' ' '\n' | sed 's/  */ /g' | grep '.' | sort -u | md5sum | cut -b 1-32`

CONFIGURE_CHECKSUM_FILE=configure.checksum
CONFIGURE_CHECKSUM="$MAKEFILE_MD5$CONFIGURE_INPUT_MD5$CONFIGURE_OPTIONS_MD5"

if test `cat $CONFIGURE_CHECKSUM_FILE` = "$CONFIGURE_CHECKSUM" ; then
  exit 0
fi

( set +ux; echo Invoking configure...; $srcdir/configure "$@" ) || exit 1
printf "%s" $CONFIGURE_CHECKSUM > $CONFIGURE_CHECKSUM_FILE

