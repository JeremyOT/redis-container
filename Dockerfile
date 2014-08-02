FROM ubuntu:14.04
MAINTAINER jeremyot@yix.io

RUN apt-get update && apt-get install libtool autoconf automake build-essential g++ uuid-dev curl -y
RUN mkdir -p /usr/lib/redis; mkdir -p /tmp/redis; curl http://download.redis.io/releases/redis-2.8.13.tar.gz > /tmp/redis/redis-2.8.13.tar.gz; cd /tmp/redis; tar xzf redis-2.8.13.tar.gz; mv redis-2.8.13/* /usr/lib/redis; cd /tmp; rm -rf /tmp/redis
RUN cd /usr/lib/redis; make
COPY run.sh /var/redis/scripts/run.sh
VOLUME ["/var/redis/data", "/var/redis/conf", "/var/logs"]
EXPOSE 6379
ENTRYPOINT ["/var/redis/scripts/run.sh"]
