#! /bin/bash
#

#DDL_DIR=/home/jneal/data/baseball/ddl
#DML_DIR=/home/jneal/data/baseball/dml

#MYSQL="mysql -u root -pwelcome1  -h 172.18.0.3"

echo "*** Bidirectional: updating birthCountry to 'Peru' for all Players"
echo "*** Bidirectional: deleting all Players"

# create one table to start with and populate it.
$MYSQL bballtrg  <<EOF
update Player set birthCountry = "Peru";
commit;
delete from Player;
commit;
EOF

sleep 30

echo "*** Bidirectional: reinitializing all Players"
$MYSQL bballsrc < $DML_DIR/Player.sql




