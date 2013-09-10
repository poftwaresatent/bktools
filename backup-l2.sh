#!/bin/sh

HOST=ide10190
SRC="/rolo /Users/rolphi"

# find level 1 stamp file

L1STAMP=`ls -t $HOST-*-l1.stamp | head -n 1`
if [ -z "$L1STAMP" ]; then
    echo "ERROR no level 1 stamp file found"
    exit 2
fi

# level 2

STAMP=`date +'%F-%T%z'`

touch $HOST-$STAMP-l2.stamp
find $SRC -type f -newer $L1STAMP | tee $HOST-$STAMP-l2.toc | tar -v -c -f $HOST-$STAMP-l2.tar -T /dev/stdin 
