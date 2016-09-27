FROM ubuntu:16.04
MAINTAINER Jadson Lourenço <jadsonlourenco@gmail.com>
LABEL Description="Percona MongoRocks"

RUN apt-get update && apt-get install -y curl && \
  curl -s -o /tmp/percona-server-mongodb-3.2.9-2.1-rd497c75-xenial-x86_64-bundle.tar https://www.percona.com/downloads/percona-server-mongodb-3.2/percona-server-mongodb-3.2.9-2.1/binary/debian/xenial/x86_64/percona-server-mongodb-3.2.9-2.1-rd497c75-xenial-x86_64-bundle.tar && \
  tar -xf /tmp/percona-server-mongodb-3.2.9-2.1-rd497c75-xenial-x86_64-bundle.tar -C /tmp/ && \
  dpkg -i /tmp/percona-server-mongodb-*.deb && \
  apt-get remove -y curl && \
  rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

ENV AUTH="yes" \
  ADMIN_USER="admin" \
  ADMIN_PASS="admin" \
  DBPATH="/data/db" \
  DB_USER="user" \
  DB_PASS="password"

EXPOSE 27017

COPY ./set_auth.sh /
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh && chmod +x /set_auth.sh

ENTRYPOINT ["/entrypoint.sh"]
