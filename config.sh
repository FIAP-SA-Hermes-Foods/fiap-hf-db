#!/bin/bash

sed -i s:{{NAME_DB}}:$NAME_DB:g ./db.tf;

sed -i s:{{USERNAME_DB}}:$USERNAME_DB:g ./db.tf;
sed -i s:{{PASSWORD_DB}}:$PASSWORD_DB:g ./db.tf;

sed -i s:{{NAME_GROUP}}:$NAME_GROUP:g ./db.tf;
sed -i s:{{VPC_ID}}:$VPC_ID:g ./db.tf;

sed -i s:{{DB_FROM_PORT}}:$DB_FROM_PORT:g ./db.tf;
sed -i s:{{DB_TO_PORT}}:$DB_TO_PORT:g ./db.tf;
