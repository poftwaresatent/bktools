#!/bin/sh

HOST=ide10190
SRC="/rolo /Users/rolphi"

# level 0

STAMP=`date +'%F-%T%z'`

touch $HOST-$STAMP-l0.stamp
tar -c -v -f $HOST-$STAMP-l0.tar $SRC 2>&1 | tee $HOST-$STAMP-l0.toc
