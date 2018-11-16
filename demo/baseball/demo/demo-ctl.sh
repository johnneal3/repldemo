#! /bin/bash
#

MYSQL_HOST=127.0.0.1
MYSQL_USER=root
MYSQL_PWD=welcome1

export DDL_DIR=../ddl
export DML_DIR=../dml

export MYSQL="mysql -u $MYSQL_USER -p$MYSQL_PWD  -h $MYSQL_HOST"

#./demo-init.sh
# http://linuxcommand.org/lc3_adv_dialog.php

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

opcomplete() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "\nOperation Complete\n" 0 0
}


working() {
  dialog --title "$1" \
    --no-collapse \
    --progressbox "Processing ..." 0 0
}

inputString() {
  # Duplicate file descriptor 1 on descriptor 3
  exec 3>&1
  result=$(dialog --title "$1" \
    --clear \
    --inputbox "Value:" 0 0 $2 2>&1 1>&3)

   # close file descriptor 3
   exec 3>&-

   RVAL=$result
}

while true; do

  exec 3>&1
  selection=$(dialog \
    --backtitle "MySQL Demo Data Generator (Baseball)" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 8 \
    "1" "Initialize Database Schemas" \
    "2" "Load remaining tables" \
    "3" "Change Player Records" \
    "4" "Check Database Connectivity" \
    "5" "Set MySQL Host" \
    "6" "Set MySQL User" \
    "7" "Set MySQL Password" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      ./demo-init.sh 2>&1 | working "Initialize Database Progress ..."
      opcomplete "Initialize Database"
      ;;
    2 )
      ./demo-run.sh 2>&1  | working "Load Remaining Tables Progress ..."
      opcomplete "Load Remaining Tables"
      ;;
    3 )
      ./demo-run2.sh 2>&1 | working "Change Player Records Progress"
      opcomplete "Change Player Records"
      ;;
    4 )
      $MYSQL < /dev/null && result="Success!!!" || result="Failed!!!" 2>&1
      display_result "Connectivity Test"
      ;;
    5 )
      inputString "Enter MySQL Hostname or IP Address" $MYSQL_HOST
      MYSQL_HOST=$RVAL
      export MYSQL="mysql -u $MYSQL_USER -p$MYSQL_PWD  -h $MYSQL_HOST"
      ;;
    6 )
      inputString "Enter MySQL User Name" $MYSQL_USER
      MYSQL_USER=$RVAL
      export MYSQL="mysql -u $MYSQL_USER -p$MYSQL_PWD  -h $MYSQL_HOST"
      ;;
    7 )
      inputString "Enter MySQL User's Password" $MYSQL_PWD
      MYSQL_PWD=$RVAL
      export MYSQL="mysql -u $MYSQL_USER -p$MYSQL_PWD  -h $MYSQL_HOST"
      ;;
  esac
done

