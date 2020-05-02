#!/bin/sh

# https://forums.docker.com/t/docker-jboss-wildfly-how-to-add-datasources-and-mysql-connector/15301

JBOSS_HOME=/opt/jboss/wildfly
JBOSS_CLI=$JBOSS_HOME/bin/jboss-cli.sh
JBOSS_MODE=${1:-"standalone"}
JBOSS_CONFIG=${2:-"$JBOSS_MODE.xml"}
#$JBOSS_CLI -c --connect

function wait_for_wildfly() {
  until `$JBOSS_CLI -c "ls /deployment" &> /dev/null`; do
    sleep 10
  done
}

echo "==> Starting WildFly..."
$JBOSS_HOME/bin/$JBOSS_MODE.sh -c $JBOSS_CONFIG > /dev/null &

echo "==> Waiting..."
wait_for_wildfly

echo "==> Executing config-ssl.cli..."
$JBOSS_CLI -c --file=`dirname "$0"`/config-ssl.cli --connect

echo "==> Executing config-datasource.cli..."
$JBOSS_CLI -c --file=`dirname "$0"`/config-datasource.cli --connect

echo "==> Shutting down WildFly..."
if [ "$JBOSS_MODE" = "standalone" ]; then
  $JBOSS_CLI -c ":shutdown"
else
  $JBOSS_CLI -c "/host=*:shutdown"
fi

rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history

exit 0