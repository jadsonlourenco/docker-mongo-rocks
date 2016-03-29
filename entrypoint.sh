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

if [ ! -f /data/db/.mongodb_password_set ]; then
  echo "=> Creating an admin user..."
  mongo admin --eval "db.createUser({user: '$USER', pwd: '$PASS', roles: ['root']});"
  echo "=> Done!"
  touch /data/db/.mongodb_password_set
fi

fg
