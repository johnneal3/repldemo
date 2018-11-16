#! /bin/bash
#

#DDL_DIR=/home/jneal/data/baseball/ddl
#DML_DIR=/home/jneal/data/baseball/dml

#MYSQL="mysql -u root -pwelcome1  -h 172.18.0.3"

# 
echo "*** setting birthCountry for all Players to 'Peru'"
echo "*** deleting all Players"
$MYSQL bballsrc <<EOF
update Player set birthCountry = "Peru";
commit;
delete from Player;
commit;
EOF


echo "*** reinitializing all Players"
$MYSQL bballsrc < $DML_DIR/Player.sql




