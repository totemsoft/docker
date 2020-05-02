# Deployment of Elixir database with the `mysql` Docker image

This shows how to deploy a `elixir` database using the [mysql](https://hub.docker.com/_/mysql) Docker image.

## Environment Variables

In addition to environment variables inherited from `mysql`, the following environment `ENV` variables can be used with this image:

    ENV         Default                 Description
    TZ          UTC                     timezone, eg `Australia/Brisbane`
    DB_HOST     host.docker.internal    MySql host
    DB_PORT     3306                    MySql port
    DB_NAME     elixir                  MySql database
    DB_USER     elixir                  MySql username
    DB_PASS     password                MySql password

## Build with:
    docker build --build-arg tz=Australia/Brisbane --tag=mysql-elixir .

## Run container
    docker run --rm -it -p 3306:3306 --name mysql --env-file ~/.docker/env.list mysql-elixir
    docker run --rm -it -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD_FILE=/run/secrets/mysql-root --env-file ~/.docker/env.list mysql-elixir

## Push tag
    docker push totemsoft/mysql-elixir:latest
