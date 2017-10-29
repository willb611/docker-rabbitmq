# What is this?
An example dockerfile which has a RabbitMQ server running in it.

## Docker stuff
### Build image
`docker build -t rabbitmq:0.1 .`

### Run container
`docker run --rm -p 5672:5672 -p 4369:4369 -p 15672:15672 rabbitmq:0.1`

### Start a bash in running container CONTAINER_NAME
`docker exec -i -t <CONTAINER_NAME> /bin/bash`

## View the RabbitMQ web console
Visit [localhost:15672](http://localhost:15672)
- User 'guest'
- Password 'guest'