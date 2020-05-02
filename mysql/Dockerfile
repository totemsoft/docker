# https://hub.docker.com/_/mysql
FROM mysql
# Maintainer
MAINTAINER Valeri Chibaev <shibaev.valera@gmail.com>

# run as root
USER root
# fix vulnerabilities on Debian GNU/Linux 10 (buster)
RUN echo $(cat /etc/os-release)
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get remove -y python-pip curl && \
    apt-get --purge autoremove -y
#RUN $(yes | rm /usr/bin/python)

# timezone
USER root
ARG tz
ENV TZ ${tz:-UTC}
RUN echo $TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo "date="$(date)

ADD db/init/schema-ddl.sql /docker-entrypoint-initdb.d/script-01.sql
ADD db/init/ref-data.sql   /docker-entrypoint-initdb.d/script-02.sql

# Expose port
ARG mysqlPort
ENV MYSQL_PORT ${mysqlPort:-3306}
EXPOSE $MYSQL_PORT
