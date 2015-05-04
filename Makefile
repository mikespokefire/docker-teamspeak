build:
	docker build -t mikespokefire/teamspeak .

run-interactive:
	docker run -it \
		--name teamspeak \
		-p=9987:9987/udp \
		-p=10011:10011 \
		-p=30033:30033 \
		-v=/data/teamspeak:/data/teamspeak \
		--entrypoint='/bin/bash' \
		mikespokefire/teamspeak

run:
	docker run -t \
		--name teamspeak \
		-p=9987:9987/udp \
		-p=10011:10011 \
		-p=30033:30033 \
		-v=/data/teamspeak:/data/teamspeak \
		mikespokefire/teamspeak

start:
	docker start teamspeak

stop:
	docker stop teamspeak
