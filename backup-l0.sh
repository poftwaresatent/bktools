#!/bin/sh

HOST=ide10190
SRC="/rolo /Users/rolphi"

# level 0

STAMP=`date +'%F_%H-%M-%S_%z'`

touch $HOST-l0-$STAMP.stamp
tar -c -v -f $HOST-l0-$STAMP.tar $SRC 2>&1 | tee $HOST-l0-$STAMP.toc
