#!/bin/bash

USER=${USER:-"admin"}
DATABASE=${DATABASE:-"admin"}
PASS=${PASS:-"admin"}

echo "Creating user in MongoDB..."
mongo admin --eval "db.createUser({user: '$USER', pwd: '$PASS', roles:[{role:'root',db:'admin'}]});"

if [ "$DATABASE" != "admin" ]; then
    mongo admin -u $USER -p $PASS << EOF
use $DATABASE
db.createUser({user: '$USER', pwd: '$PASS', roles:[{role:'dbOwner',db:'$DATABASE'}]})
EOF
fi

echo "MongoDB configured."
touch /data/db/.mongodb_password_set
