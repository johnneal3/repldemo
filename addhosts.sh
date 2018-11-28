#! /bin/bash
#
# add the hostname and IP address for each of the docker containers
# to /etc/hosts.
#

addhosts() {
   # docker inspect --format='{{range .NetworkSettings.Networks}}{{.Aliases}} {{.IPAddress}}{{end}}' $1
   docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}  {{.Name}}' $1 \
      | sed  's/\///'
}

for i in $(docker ps -a | grep -v CONTAINER | sed 's/ .*$//')
do
   echo $(addhosts $i) >>  /etc/hosts
done

