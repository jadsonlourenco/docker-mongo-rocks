FROM ubuntu:14.04
MAINTAINER Jadson Lourenço <jadsonlourenco@gmail.com>
LABEL Description="Percona MongoRocks"

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A && \
  echo "deb http://repo.percona.com/apt "$(lsb_release -sc)" main" | sudo tee /etc/apt/sources.list.d/percona.list && \
  echo "deb-src http://repo.percona.com/apt "$(lsb_release -sc)" main" | sudo tee -a /etc/apt/sources.list.d/percona.list && \
  apt-get update && \
  apt-get install percona-server-mongodb -y -f

ENV AUTH yes
ENV PASS mongorocks

EXPOSE 27017

VOLUME /data/db

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
