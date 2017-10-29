# What is this?
An example dockerfile which has a RabbitMQ server running in it.

## Build image
`docker build -t rabbitmq:0.1 .`

## Run container
`docker run --rm -p 5672:5672 -p 4369:4369 rabbitmq:0.1`

## Connect to `CONTAINER_NAME` on windows
`docker exec -i -t <CONTAINER_NAME> /bin/bash`