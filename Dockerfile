FROM websphere-liberty:javaee7
MAINTAINER Murad Korejo <mkorejo@us.ibm.com>

COPY JPetStore.war /tmp/
COPY ./entrypoint.sh /jpetstore_entrypoint.sh

ENV DB_HOST="172.17.0.1"

RUN apt-get update && apt-get install -y zip \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/jpetstore_entrypoint.sh", "jpetstore-wlp"]
