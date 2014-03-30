#!/bin/sh

HOST=ide10190
SRC="/rolo /Users/rolphi"

FILTER='-e .DS_Store -e /rolo/tmp -e /Users/rolphi/Library/Logs -e /Users/rolphi/Library/Developer/Shared/Documentation -e /Users/rolphi/Library/Caches'

# level 0

STAMP=`date +'%F_%H-%M-%S_%z'`

touch $HOST-l0-$STAMP.stamp
tar -c -v -f $HOST-l0-$STAMP.tar $SRC 2>&1 | fgrep -v $FILTER | tee $HOST-l0-$STAMP.toc
