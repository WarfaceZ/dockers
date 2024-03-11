.PHONY: init start stop restart logs register-domain

init:
	cp $(shell pwd)/.env.template $(shell pwd)/.env 1> /dev/null
	cp $(shell pwd)/docker-compose.template.yml $(shell pwd)/docker-compose.yml 1> /dev/null

start:
	(docker compose up -d --remove-orphans)
stop:
	(docker compose stop)

restart: stop start
logs:
	(docker compose logs --follow)

register-domain:
	$(shell pwd)/bin/create-domain.sh