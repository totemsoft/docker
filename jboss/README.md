# Deployment of Elixir with the `jboss/wildfly` Docker image

This shows how to deploy a `elixir.war` file using the [jboss/wildfly](https://registry.hub.docker.com/u/jboss/wildfly/) Docker image.

## Instructions

Environment Variables

In addition to environment variables inherited from `jboss/wildfly`, the following environment `ENV` variables can be used with this image:

    ENV         Default                 Description
    TZ          UTC                     timezone, eg `Australia/Brisbane`
    DB_HOST     host.docker.internal    MySql host
    DB_PORT     3306                    MySql port
    DB_NAME     elixirdb                MySql database
    DB_USER     elixir                  MySql username
    DB_PASS     Passw0rd                MySql password

    JAVA_OPTS   -Xms64m -Xmx512m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true

Checkout project locally:

    cd /tmp
    git clone --depth=1 --single-branch --branch feature/wildfly https://shibaevv@bitbucket.org/shibaevv/xcelerate.git
    rm -rf /tmp/xcelerate/.git
    rm -rf /tmp/xcelerate/aws
    rm -f  /tmp/xcelerate/bitbucket-pipelines.yml
    rm -f  /tmp/xcelerate/deploy*.*
    rm -rf /tmp/xcelerate/docker
    rm -f  /tmp/xcelerate/Dockerfile
    rm -rf /tmp/xcelerate/docs
    rm -f  /tmp/xcelerate/README.md
    rm -rf /tmp/xcelerate/workflow-web
    cd ~/git/docker/jboss
    cp -a /tmp/xcelerate/ ~/git/docker/jboss

Run the build with:

    docker build --build-arg tz=Australia/Brisbane --tag=wildfly-elixir .
    docker images
    docker image prune
    docker image rm <image_id>

Run container

    docker run --rm -it -p 443:8443 -p 9993:9993 --name jboss --env-file ~/.docker/env.list wildfly-elixir:latest
    docker run --rm -it -p 443:8443 --name jboss --env-file ~/.docker/env.list wildfly-elixir

See the elixir is working

    curl https://localhost:443/elixir/

## Push tag
    docker push totemsoft/wildfly-elixir:latest

## Application source code

You can find the `elixir-jboss.war` source code in the [shibaevv/elixir-web](https://bitbucket.org/shibaevv/xcelerate/src/master/elixir-web/) repository.
