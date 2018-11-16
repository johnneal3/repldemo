#! /bin/bash
#
# dump JSON messages from one or more topics. Doesn't yet support
# Avro and the schema registry.
#
# Topics are specified in --whitelist ... separate topic names by | if 
# more than one.
# --max-messages limits how many will be displayed.
#

docker exec -it kafka kafka-console-consumer \
   --bootstrap-server kafka:29092 \
   --whitelist 'streamsets' \
   --max-messages 50
   

#   --from-beginning \

