#!/bin/bash

HOST=ide10190
SRC="/rolo /Users/rolphi"

# level 0

STAMP=`date +'%F_%H-%M-%S_%z'`
FIND="find $SRC -type f"
SPLIT="split -b 2048k - $HOST-l0-$STAMP.tar"

touch $HOST-l0-$STAMP.stamp
tar -v -c -f >($SPLIT) -T <($FIND) | tee $HOST-l0-$STAMP.toc
