# Teamspeak on docker

Teamspeak 3 server powered by docker.

## Running

```bash
$ mkdir -p /data/teamspeak
$ docker run -t \
    --name teamspeak \
    -p=9987:9987/udp \
    -p=10011:10011 \
    -p=30033:30033 \
    -v=/data/teamspeak:/data/teamspeak \
    mikespokefire/teamspeak
