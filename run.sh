#!/bin/bash

CONFIG_FILE=/etc/redis/redis.conf

case $1 in
  redis-cli)
    /usr/lib/redis/src/redis-cli "${@:2}"
    ;;
  *)
    if [ -f $CONFIG_FILE ];
    then
      echo "Using config found at $CONFIG_FILE"
    else
      cp /etc/redis-default/redis.conf $CONFIG_FILE
      echo "Default config copied to $CONFIG_FILE"
    fi
    /usr/lib/redis/src/redis-server $CONFIG_FILE "${@:2}"
    ;;
esac
