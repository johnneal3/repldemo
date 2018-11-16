#! /bin/bash
#
# Pick docker containers to configure and start for a demo. 
# Makes use of a terminal-based 'dialog' selection checklist
# widget to allow selection of desired containers. The
# checklist items are taken from the file names found in the
# $YML directory. Once containers have been selected, this script
#
# * runs docker-compose to start those containers
# * sleeps a bit, and then starts firefox, pointing it to the
#   web interfaces for those containers that have one
# * starts the baseball demo script for loading data into MySQL
#

# check if docker is running and start it if needed
echo "*** Checking status of docker ***"
docker info 2>/dev/null
if [ $? -eq 1 ]
then
   echo "*** Docker is not running. Starting it now."
   docker-start.sh
else
   echo "*** Docker is running"
fi

# expect a series of *.yml files to be in $YML directory
YML="/home/docker/yml"

YAMLFILES=$(ls ${YML}/*.yml)

# identify containers that should default to 'on'
menu="1 portainer on 2 mysql on 3 replicate_6_1 on"
array[0]="portainer"
array[1]="mysql"
array[2]="replicate_6_1"
# bump the count by the menu items we default to "on"
counter=3

# build the menu
for i in $YAMLFILES
do
  TARGET=${i%.yml}
  TARGET=${TARGET##*/}
  case $TARGET in
  "replnet")
     # replnet will always be configured
     ;;
  "replicate_6_1" | "portainer" | "mysql")
     # these default to "on" and are configured above
     ;;
  *)
     array[$counter]=$TARGET
     let counter=counter+1;
     menu="$menu $counter $TARGET off"
     ;;
  esac
done
let counter=counter+2
let height=counter+5
height=$(($height<19?$height:19))


# Define the dialog exit status codes
: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_HELP=2}
: ${DIALOG_EXTRA=3}
: ${DIALOG_ITEM_HELP=4}
: ${DIALOG_ESC=255}

#duplicate files descriptor 1 on descriptor 3
exec 3>&1

selection=$(dialog \
   --backtitle "Docker-Compose Demo Configuration" \
   --clear \
   --checklist "Select Containers for Demo" $height 50 ${counter} \
   ${menu} \
   2>&1 1>&3)

exit_status=$?

# close file descriptor 3
exec 3>&-

case $exit_status in
  $DIALOG_CANCEL)
    clear
    echo "*** Program terminated."
    exit
    ;;
  $DIALOG_ESC)
    clear
    echo "*** Program aborted." >&2
    exit 1
    ;;
esac

clear

kafka=0
mysql=0
containers="-f $YML/replnet.yml"
for i in $selection
do
   service=${array[$i-1]}

   case $service in
     "portainer")
         PORTAINER_URL="localhost:9000"
         browser=1
         ;;
     "replicate_6_1")
         REPLICATE_URL="localhost:3552/attunityreplicate"
         browser=1
         ;;
     "replicate_6_2")
         REPLICATE62_URL="localhost:3553/attunityreplicate"
         browser=1
         ;;
     "streamsets")
         SDC_URL="localhost:18630"
         browser=1
         ;;
     "memsql")
         MEMSQL_URL="localhost:29000"
         browser=1
         ;;
      "mysql")
         mysql=1
         ;;
      "kafka")
         kafka=1
         ;;
      *)
         ;;
   esac

   YAML=$YML/$service.yml
   containers="$containers -f $YAML"
done

sleep 1
echo "*** Starting requested containers ***"
docker-compose -p attunity $containers up -d

if [ $kafka -eq 1 ]
then
   SLEEP=20
else
   SLEEP=10
fi
echo "*** Pausing $SLEEP seconds to give containers time to stabilize ***"
sleep $SLEEP 

if [ $browser -eq 1 ]
then
   echo "*** Starting Firefox ***"
   firefox $PORTAINER_URL $REPLICATE_URL $REPLICATE62_URL $SDC_URL $MEMSQL_URL &
   sleep 10
fi

if [ $mysql -eq 1 ]
then
   echo "*** Starting Baseball Demo in a new terminal ***"
   gnome-terminal -x bash -c "baseball.sh"
fi

exit 0
