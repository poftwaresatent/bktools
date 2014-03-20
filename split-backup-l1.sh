#!/bin/bash

HOST=ide10190
SRC="/rolo /Users/rolphi"

# find level 0 stamp file

L0STAMP=`ls -t $HOST-l0-*.stamp | head -n 1`
if [ -z "$L0STAMP" ]; then
    echo "ERROR no level 0 stamp file found"
    exit 2
fi

# level 1

STAMP=`date +'%F_%H-%M-%S_%z'`
FIND="find $SRC -type f -newer $L0STAMP"
SPLIT="split -b 2048m - $HOST-l1-$STAMP.tar"

touch $HOST-l1-$STAMP.stamp
tar -v -c -f >($SPLIT) -T <($FIND) | tee $HOST-l1-$STAMP.toc
