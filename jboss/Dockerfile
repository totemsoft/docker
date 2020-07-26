# https://hub.docker.com/_/maven
FROM maven:3.6.3-openjdk-11 AS MAVEN_TOOL_CHAIN
# Maintainer
MAINTAINER Valeri Chibaev <shibaev.valera@gmail.com>

# timezone
USER root
ARG tz
ENV TZ ${tz:-UTC}
RUN echo $TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN echo "date="$(date)

# get source code
RUN git clone --depth=1 --single-branch --branch master https://github.com/totemsoft/elixir.git /tmp/build
RUN rm -rf /tmp/build/.git
# Maven
ENV M2_REPO https://repo1.maven.org/maven2
ADD $M2_REPO/com/lowagie/itext/4.2.1/itext-4.2.1.jar /tmp/build/elixir-web/src/main/webapp/WEB-INF/lib
# create elixir war file
WORKDIR /tmp/build/
RUN mvn clean package -Dtest -DfailIfNoTests=false

# https://hub.docker.com/r/jboss/wildfly/
FROM jboss/wildfly
#RUN echo $(whoami)

# Database
#ENV DB_HOST host.docker.internal
#ENV DB_PORT 3306
#ENV DB_NAME <database>
#ENV DB_USER <username>
#ENV DB_PASS <password>
#
# JBoss admin
ARG wildflyUser
ENV WILDFLY_USER ${wildflyUser:-admin}
ARG wildflyPass
ENV WILDFLY_PASS ${wildflyPass:-Admin#Passw0rd}
RUN $JBOSS_HOME/bin/add-user.sh $WILDFLY_USER $WILDFLY_PASS --silent
EXPOSE 9993

# Expose https port
ARG httpsPort
ENV HTTPS_PORT ${httpsPort:-8443}
EXPOSE $HTTPS_PORT

# Expose smtp port
ARG smptPort
ENV SMTP_PORT ${smptPort:-25}
EXPOSE $SMTP_PORT

#ARG bindAddress
#ENV BIND_ADDRESS ${bindAddress:-0.0.0.0}
#
# extend image
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
#ENV JAVA_OPTS -Xms256m -Xmx1024m -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true

# run as root
USER root
# fix vulnerabilities
RUN echo $(cat /etc/os-release)
RUN yum update -y
RUN $(yes | rm /usr/bin/python)
# Maven
ENV M2_REPO https://repo1.maven.org/maven2
# add mysql module
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/modules/com/mysql/main/module.xml $JBOSS_HOME/modules/com/mysql/main/
ADD $M2_REPO/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar $JBOSS_HOME/modules/com/mysql/main/
ADD $M2_REPO/org/jboss/jbossas/jboss-as-connector/6.1.0.Final/jboss-as-connector-6.1.0.Final.jar $JBOSS_HOME/modules/com/mysql/main/
RUN chmod u+rw,g+rw,o+r $JBOSS_HOME/modules/com/mysql/main/*
# add org.aspectj module
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/modules/org/aspectj/main/module.xml $JBOSS_HOME/modules/org/aspectj/main/
ADD $M2_REPO/org/aspectj/aspectjweaver/1.8.9/aspectjweaver-1.8.9.jar $JBOSS_HOME/modules/org/aspectj/main/
RUN chmod u+rw,g+rw,o+r $JBOSS_HOME/modules/org/aspectj/main/*
# add spring module
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/modules/org/springframework/spring/main/module.xml $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-aop/4.3.26.RELEASE/spring-aop-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-beans/4.3.26.RELEASE/spring-beans-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-context/4.3.26.RELEASE/spring-context-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-context-support/4.3.26.RELEASE/spring-context-support-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-core/4.3.26.RELEASE/spring-core-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-expression/4.3.26.RELEASE/spring-expression-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-jdbc/4.3.26.RELEASE/spring-jdbc-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-orm/4.3.26.RELEASE/spring-orm-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-oxm/4.3.26.RELEASE/spring-oxm-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-tx/4.3.26.RELEASE/spring-tx-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-web/4.3.26.RELEASE/spring-web-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
ADD $M2_REPO/org/springframework/spring-webmvc/4.3.26.RELEASE/spring-webmvc-4.3.26.RELEASE.jar $JBOSS_HOME/modules/org/springframework/spring/main/
RUN chmod u+rw,g+rw,o+r $JBOSS_HOME/modules/org/springframework/spring/main/*
# chown
RUN chown -R jboss $JBOSS_HOME/modules/
#
# jboss config via cli
USER jboss
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/cli/config.sh /tmp/build/
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/cli/config-property.cli /tmp/build/
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/cli/config-ssl.cli /tmp/build/
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/cli/config-datasource.cli /tmp/build/
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/jboss/cli/server.keystore $JBOSS_HOME/standalone/configuration/
RUN /tmp/build/config.sh
#
# add elixir deployment
COPY --from=MAVEN_TOOL_CHAIN /tmp/build/elixir-web/target/elixir-jboss.war $JBOSS_HOME/standalone/deployments/
#
#USER root
#RUN yum install nc -y
#RUN yum install telnet -y
#RUN yum install mysql -y
# mysql -h $DB_HOST -p $DB_NAME -u $DB_USER
# select * from dbversion;
#
USER jboss

#
#HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1
