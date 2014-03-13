#!/bin/sh

HOST=ide10190
SRC="/rolo /Users/rolphi"

# find level 1 stamp file

L1STAMP=`ls -t $HOST-l1-*.stamp | head -n 1`
if [ -z "$L1STAMP" ]; then
    echo "ERROR no level 1 stamp file found"
    exit 2
fi

# level 2

STAMP=`date +'%F_%H-%M-%S_%z'`

touch $HOST-l2-$STAMP.stamp
find $SRC -type f -newer $L1STAMP | tee $HOST-l2-$STAMP.toc | tar -v -c -f $HOST-l2-$STAMP.tar -T /dev/stdin 
