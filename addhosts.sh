#! /bin/bash

addhosts() {
   # docker inspect --format='{{range .NetworkSettings.Networks}}{{.Aliases}} {{.IPAddress}}{{end}}' $1
   docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}  {{.Name}}' $1 \
      | sed  's/\///'
}

# host addresses can change each time the docker images are started
# so we need to remove old entries before we add new ones.
cp /etc/hosts hosts.tmp
grep -v repldemo hosts.tmp > /etc/hosts
rm hosts.tmp

for i in $(docker ps -a | grep -v CONTAINER | sed 's/ .*$//')
do
   echo "$(addhosts $i)       # docker repldemo"   >> /etc/hosts
done

exit 0

