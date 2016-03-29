#!/bin/bash
set -m

mongodb_cmd="mongod --storageEngine rocksdb"
cmd="$mongodb_cmd --httpinterface --rest --master"
if [ "$AUTH" == "yes" ]; then
    cmd="$cmd --auth"
fi

if [ "$OPLOG_SIZE" != "" ]; then
    cmd="$cmd --oplogSize $OPLOG_SIZE"
fi

$cmd &

sleep 5
if [ "$AUTH" == "yes" ]; then
    mongo admin --eval "db.createUser({user: 'admin', pwd: '$PASS', roles: ['root']});"
fi
echo "=> Done!"

fg
