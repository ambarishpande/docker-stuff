#####################################################################################
# Dockerfile that provides the image for JBoss Drools Workbench 7.2.0.Final Showcase
# Modified to allow:
# 1) Mounting of guvnor-m2-repo maven repo as a docker volume.
# 2) Addition of custom user credentials at launch time.
#####################################################################################

####### BASE ############
FROM jboss/drools-workbench:7.2.0.Final

####### MAINTAINER ############
MAINTAINER "Ambarish Pande <ambarish@datatorrent.com>"

####### ENVIRONMENT ############
# Use demo and examples by default in this showcase image (internet connection required).
ENV KIE_SERVER_PROFILE standalone-full-drools
ENV JAVA_OPTS -Xms256m -Xmx512m -Djava.net.preferIPv4Stack=true

####### Drools Workbench CUSTOM CONFIGURATION ############
RUN mkdir -p $HOME/.m2
ADD etc/standalone-full-drools.xml $JBOSS_HOME/standalone/configuration/standalone-full-drools.xml
ADD etc/application-users.properties $JBOSS_HOME/standalone/configuration/application-users.properties
ADD etc/application-roles.properties $JBOSS_HOME/standalone/configuration/application-roles.properties
ADD etc/settings.xml $JBOSS_HOME/../.m2/settings.xml
ADD etc/start_drools-wb.sh $JBOSS_HOME/bin

# Added files are chowned to root user, change it to the jboss one.
USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/standalone-full-drools.xml && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/application-users.properties && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/application-roles.properties && \
chown jboss:jboss $JBOSS_HOME/../.m2/settings.xml &&\
chown jboss:jboss $JBOSS_HOME/bin/start_drools-wb.sh
# Switchback to jboss user
USER jboss

####### RUNNING DROOLS-WB ############
WORKDIR $JBOSS_HOME/bin/
CMD ["./start_drools-wb.sh"]
