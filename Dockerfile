# https://github.com/phusion/baseimage-docker#using
FROM phusion/baseimage:0.9.22

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

## Update OS
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN apt-get install -y wget
# Get rabbitMQ
RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' | tee /etc/apt/sources.list.d/rabbitmq.list
RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
RUN apt-get install -y rabbitmq-server

## Clean up APT when done.
RUN apt-get -y remove wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Make RabbitMQ startup script
RUN mkdir -p /etc/my_init.d
COPY start-rabbitmq.bash /etc/my_init.d/start-rabbitmq.bash
RUN chmod +x /etc/my_init.d/start-rabbitmq.bash

# Config files
COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config


# Expose ports
## AMQP port
EXPOSE 5672
## Admin web console
EXPOSE 15672
# EPMD (status monitor?)
EXPOSE 4369