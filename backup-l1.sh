#!/bin/sh

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

touch $HOST-l1-$STAMP.stamp
find $SRC -type f -newer $L0STAMP | tee $HOST-l1-$STAMP.toc | tar -v -c -f $HOST-l1-$STAMP.tar -T /dev/stdin 
