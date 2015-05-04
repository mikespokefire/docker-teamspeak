FROM ubuntu:14.04
MAINTAINER Michael Smith <mike@spokefire.co.uk>

# Non interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

# UTF8 OS!
RUN locale-gen --no-purge en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget

RUN wget -O teamspeak3-server_linux-amd64-3.0.11.3.tar.gz http://dl.4players.de/ts/releases/3.0.11.3/teamspeak3-server_linux-amd64-3.0.11.3.tar.gz
RUN tar -xzvf teamspeak3-server_linux-amd64-3.0.11.3.tar.gz
WORKDIR teamspeak3-server_linux-amd64
RUN mkdir -p /data/teamspeak
RUN touch ts3server.sqlitedb

ADD scripts/start /start

EXPOSE 9987/udp 10011 30033

VOLUME ["/data/teamspeak"]
ENTRYPOINT ["/start"]
