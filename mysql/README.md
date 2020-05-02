# Deployment of Elixir database with the `mysql` Docker image

This shows how to deploy a `elixir` database using the [mysql](https://hub.docker.com/_/mysql) Docker image.

## Environment Variables

In addition to environment variables inherited from `mysql`, the following environment `ENV` variables can be used with this image:

    ENV                        Default                 Description
    TZ                         UTC                     timezone, eg `Australia/Brisbane`
    MYSQL_PORT                 3306                    MySql port
    MYSQL_DATABASE             elixirdb                MySql database
    MYSQL_USER                 elixir                  MySql username
    MYSQL_PASSWORD             Passw0rd                MySql password
    MYSQL_RANDOM_ROOT_PASSWORD yes

## Build with:
    docker build --build-arg tz=Australia/Brisbane --tag=mysql-elixir .
    docker images
    docker image prune
    docker image rm <image_id>

## Run container
    docker run --rm -it -p 3306:3306 --name mysql --env-file ~/.docker/env.list mysql-elixir
    docker run --rm -it -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD_FILE=/run/secrets/mysql-root --env-file ~/.docker/env.list mysql-elixir

## Push tag
    docker push totemsoft/mysql-elixir:latest

