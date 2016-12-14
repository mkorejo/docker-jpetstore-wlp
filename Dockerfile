FROM websphere-liberty:javaee7
MAINTAINER Murad Korejo <mkorejo@us.ibm.com>

ADD JPetStore.war /config/dropins/

ENTRYPOINT /opt/ibm/docker/docker-server run defaultServer
