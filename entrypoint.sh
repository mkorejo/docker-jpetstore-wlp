#!/bin/bash

set -e

if [ "$1" = 'jpetstore-wlp' ]; then

  mkdir /tmp/JPetStore_expanded
  unzip /tmp/JPetStore.war -d /tmp/JPetStore_expanded
  sed -i "s/172\.17\.0\.1/$DB_HOST/" /tmp/JPetStore_expanded/WEB-INF/classes/properties/database.properties
  zip -r /tmp/JPetStore.war /tmp/JPetStore_expanded
  cp /tmp/JPetStore.war /config/dropins/
  rm -rf /tmp/JPetStore*
  exec /opt/ibm/docker/docker-server run defaultServer

elif [ "$1" = 'sleep' ]; then

  while true; do
    echo "running sleep";
    sleep 10;
  done;

fi;
