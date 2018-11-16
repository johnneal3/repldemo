#! /bin/bash
#
# run the main part of the demo
#

#DDL_DIR=/home/jneal/data/baseball/ddl
#DML_DIR=/home/jneal/data/baseball/dml


#MYSQL="mysql -u root -pwelcome1  -h 172.18.0.3"


# create one table to start with and populate it.
echo "*** Creating Managers"
$MYSQL bballsrc < $DDL_DIR/Managers_ddl.sql
echo "*** Populating Managers"
$MYSQL bballsrc < $DML_DIR/Managers.sql
echo "*** Creating Parks"
$MYSQL bballsrc < $DDL_DIR/Parks_ddl.sql
echo "*** Populating Parks"
$MYSQL bballsrc < $DML_DIR/Parks.sql

