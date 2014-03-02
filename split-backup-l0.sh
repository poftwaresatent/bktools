#!/bin/bash

HOST=ide10190
SRC="/rolo /Users/rolphi"

# level 0

STAMP=`date +'%F-%T%z'`
FIND="find $SRC -type f"
SPLIT="split -b 2048k - $HOST-$STAMP-l0.tar"

touch $HOST-$STAMP-l0.stamp
tar -v -c -f >($SPLIT) -T <($FIND) | tee $HOST-$STAMP-l0.toc
