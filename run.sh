#!/bin/bash

case $1 in
  redis-cli)
    /usr/lib/redis/src/redis-cli ${@:2}
    ;;
  *)
    cd /var/redis/data
    /usr/lib/redis/src/redis-server ${@:2}
    ;;
esac
