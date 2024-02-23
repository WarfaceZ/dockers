.PHONY: create-traefik start start-with-traefik start-no-traefik

create-traefik:
	docker run -d -p 80:80 -p 8080:8080 \
          -v /var/run/docker.sock:/var/run/docker.sock \
          -v $(shell pwd)/traefik.yml:/traefik.yml \
          --network traefik \
          --name traefik \
          traefik:v2.11
start: start-with-traefik

start-with-traefik:
	docker start traefik