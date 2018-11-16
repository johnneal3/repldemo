#! /bin/bash
#
# List all topics the broker knows about
#

docker exec -it kafka kafka-topics \
   --zookeeper zkhost:32181 \
   --list 


