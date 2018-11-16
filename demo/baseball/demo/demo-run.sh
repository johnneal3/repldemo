#! /bin/bash
#
# run the main part of the demo
#

#DDL_DIR=/home/jneal/data/baseball/ddl
#DML_DIR=/home/jneal/data/baseball/dml


#MYSQL="mysql -u root -pwelcome1  -h 172.18.0.3"


for i in $DML_DIR/*
do
   filename=${i##*/}
   filename=${filename%.sql}
   if [ "$filename" = "Player" ]
   then
      echo "Skipping Player.sql"
      continue
   fi

   # create one table to start with and populate it.
   echo "*** creating $filename"
   $MYSQL bballsrc < $DDL_DIR/${filename}_ddl.sql
   echo "*** populating $filename"
   $MYSQL bballsrc < $DML_DIR/${filename}.sql

done


