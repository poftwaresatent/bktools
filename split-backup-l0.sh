#!/bin/bash

HOST=ide10190
SRC="/rolo /Users/rolphi"

FILTER='-e .DS_Store -e /rolo/tmp -e /Users/rolphi/Library/Logs -e /Users/rolphi/Library/Developer/Shared/Documentation -e /Users/rolphi/Library/Caches'

# level 0

STAMP=`date +'%F_%H-%M-%S_%z'`
FIND="find $SRC -type f"
SPLIT="split -b 2048m - $HOST-l0-$STAMP.tar"

touch $HOST-l0-$STAMP.stamp
tar -v -c -f >($SPLIT) -T <($FIND  | fgrep -v $FILTER) | tee $HOST-l0-$STAMP.toc
