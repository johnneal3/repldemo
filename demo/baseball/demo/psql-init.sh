#! /bin/bash
#
# Cleanup from previous runs if needed. 
# Create source and target schemas.
# Init the MySQL source with one table.

DDL_DIR=/home/jneal/data/baseball/ddl
DML_DIR=/home/jneal/data/baseball/dml
export PGPASSWORD=welcome1

MYSQL="psql -U postgres  -h 172.18.0.10"

# drop source and target schemas if they exist.
$MYSQL < $DDL_DIR/dropdb_ddl.sql

# create the source and target schemas.
$MYSQL < $DDL_DIR/createdb_ddl.sql

# create one table to start with and populate it.
$MYSQL bballsrc < $DDL_DIR/Player_ddl.sql
$MYSQL bballsrc < $DML_DIR/Player.sql


