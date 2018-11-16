#! /bin/bash
#
# Cleanup from previous runs if needed. 
# Create source and target schemas.
# Init the MySQL source with one table.

# DDL_DIR=/home/jneal/data/baseball/ddl
# DML_DIR=/home/jneal/data/baseball/dml

# MYSQL="mysql -u root -pwelcome1  -h 172.18.0.3"

# drop source and target schemas if they exist.
echo "*** Dropping source and target schemas if they exist"
$MYSQL < $DDL_DIR/dropdb_ddl.sql

# create the source and target schemas.
echo "*** creating source and target schemas"
$MYSQL < $DDL_DIR/createdb_ddl.sql

# create one table to start with and populate it.
echo "*** creating Player table"
$MYSQL bballsrc < $DDL_DIR/Player_ddl.sql
echo "*** populating Player table"
$MYSQL bballsrc < $DML_DIR/Player.sql

for i in AllstarFull_ddl.sql Appearances_ddl.sql AwardsManagers_ddl.sql AwardsPlayers_ddl.sql AwardsShareManagers_ddl.sql AwardsSharePlayers_ddl.sql Batting_ddl.sql BattingPost_ddl.sql CollegePlaying_ddl.sql Fielding_ddl.sql FieldingOF_ddl.sql FieldingOFsplit_ddl.sql FieldingPost_ddl.sql HallOfFame_ddl.sql HomeGames_ddl.sql Managers_ddl.sql ManagersHalf_ddl.sql Parks_ddl.sql Pitching_ddl.sql PitchingPost_ddl.sql Salaries_ddl.sql Schools_ddl.sql SeriesPost_ddl.sql Teams_ddl.sql TeamsFranchises_ddl.sql TeamsHalf_ddl.sql
do
echo "*** creating $i table"
$MYSQL bballsrc < $DDL_DIR/$i
done
