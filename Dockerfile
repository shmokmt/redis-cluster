FROM redis:6.2.4

COPY redis.conf /usr/local/etc/redis/redis.conf
RUN chown -R redis.redis /usr/local/etc/redis

CMD  ["redis-server", "/usr/local/etc/redis/redis.conf"]
