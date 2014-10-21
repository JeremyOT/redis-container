FROM debian:wheezy
MAINTAINER jeremyot@gmail.com

RUN apt-get update && apt-get install autoconf automake build-essential g++ uuid-dev curl -y; \
    mkdir -p /usr/lib/redis; mkdir -p /tmp/redis; curl http://download.redis.io/releases/redis-2.8.17.tar.gz > /tmp/redis/redis-2.8.17.tar.gz; cd /tmp/redis; tar xzf redis-2.8.17.tar.gz; mv redis-2.8.17/* /usr/lib/redis; cd /tmp; rm -rf /tmp/redis; \
    cd /usr/lib/redis; make; \
    apt-get remove --purge -y autoconf automake build-essential g++ uuid-dev curl; \
    apt-get autoremove --purge -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY run.sh /usr/lib/redis/scripts/run.sh
VOLUME ["/var/redis/data", "/var/redis/conf", "/var/logs"]
EXPOSE 6379
ENTRYPOINT ["/usr/lib/redis/scripts/run.sh"]
