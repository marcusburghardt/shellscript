#!/bin/bash
# MBSEC Segurança da Informação
# Author: Marcus Burghardt - marcus@mbsec.com.br
#
# This script will replace permissions recursively from
# one folder to another. Please, pay attention at usage.
# Some use case is to restore the permissions from a backup source
# after a disaters, considering the permissions were lost.
#
# Creation: 2017-09-19
#
DIR_SRC=$1
DIR_DST=$2

if [ $# != 2 ]; then
 echo $"Usage: $0 <source folder>/ <destination folder>/"
 echo $"WARN: Use slash at end of path. This is for your extra safety!"
 echo $"WARN: Use double quotes if there is spaces or special characters."
 exit 2
else
 echo ""
 echo "Source permissions from: $DIR_SRC"
 echo "Target permissions to: $DIR_DST"
 echo "Are you sure? Press CRTL+C to cancel or any other to continue."
 read OK
fi

for file in `find $DIR_SRC`; do
 # This approach removes the source path part.
 FILE=${file#*$DIR_SRC}
 FULL_SRC="${DIR_SRC}$FILE"
 FULL_DST="${DIR_DST}$FILE"
 chmod -v --reference=$FULL_SRC $FULL_DST
done
