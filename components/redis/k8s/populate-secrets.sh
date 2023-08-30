#!/bin/sh

work_dir=$(dirname $0)

REDIS_PASSWORD=$(pass perso/Servers/Redis/password) \
    envsubst > $work_dir/redis.conf < $work_dir/redis.conf.tmpl
