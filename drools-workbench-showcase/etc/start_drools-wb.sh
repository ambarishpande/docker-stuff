#!/usr/bin/env bash

# Start Wildfly with the given arguments.
echo "Running Drools Workbench on JBoss Wildfly..."
echo $WBUSERNAME
echo $WBPASSWORD
echo $ROLE
REALM="ApplicationRealm"
./add-user.sh -a -g $ROLE -u $WBUSERNAME -p $WBPASSWORD -r $REALM
exec ./standalone.sh -b $JBOSS_BIND_ADDRESS -c $KIE_SERVER_PROFILE.xml -Dorg.kie.demo=$KIE_DEMO -Dorg.kie.example=$KIE_DEMO


