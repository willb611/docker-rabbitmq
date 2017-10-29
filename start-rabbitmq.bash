#!/bin/bash
export HOME="/root"
## Enable web console
/usr/sbin/rabbitmq-plugins --offline enable rabbitmq_management
## Start service
service rabbitmq-server start
