#!/bin/bash

HOST=ide10190
SRC="/rolo /Users/rolphi"

# find level 1 stamp file

L1STAMP=`ls -t $HOST-l1-*.stamp | head -n 1`
if [ -z "$L1STAMP" ]; then
    echo "ERROR no level 0 stamp file found"
    exit 2
fi

# level 2

STAMP=`date +'%F_%H-%M-%S_%z'`
FIND="find $SRC -type f -newer $L1STAMP"
SPLIT="split -b 2048m - $HOST-l2-$STAMP.tar"

touch $HOST-l2-$STAMP.stamp
tar -v -c -f >($SPLIT) -T <($FIND) | tee $HOST-l2-$STAMP.toc
