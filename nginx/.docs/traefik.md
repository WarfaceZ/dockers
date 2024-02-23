# Traefik
Jestli nechceme se otravovat s porty pro kazdou aplikaci, můžeme využít traefik.

Takže místo 127.0.0.1:8900 budeme mít například admin-app.1webit.cz.local

Je důležité, aby byli porty 80 a 8080 volné, takže nemít například zapnutý apache nebo nginx u sebe.

Na dashboard traefiku se dostaneme na adrese [127.0.0.1:8080](http://127.0.0.1:8080)

# Jak nastavit

~/traefik.yml
```yaml
## traefik.yml

# Docker configuration backend
providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    defaultRule: "Host(`{{ trimPrefix `/` .Name }}.docker.localhost`)"

entryPoints:
  http:
    address: ":80"
# API and dashboard configuration
api:
  dashboard: true
  insecure: true

```

```shell
docker network create traefik
```

```shell
docker run -d -p 80:80 -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/traefik.yml:/traefik.yml \
  --network traefik \
  --name traefik \
  traefik:v2.10
```

/etc/hosts
```
127.0.0.1   admin-app.local
```

Při restartu PC už jen spouštíme pomocí
```shell
docker start traefik
```

# Nastavení v projektu
Nastavení je jednoduché, vytvoříme si docker-compose.override.yml a v něm přidáme

```yaml
services:
  webserver:
    # ... nastaveni
    labels:
      - "traefik.enable=true"
      - "traefik.port=80"
      - "traefik.http.routers.admin_app_1webit_cz.rule=Host(`admin-app.1webit.cz.local`)"
      - "traefik.http.services.admin_app_1webit_cz.loadbalancer.server.port=80"
    networks:
      - traefik

networks:
  traefik:
    name: traefik
    external: true
```

Všimněte si v labelu pojmenování `.admin_app_1webit_cz`, je důležité, aby byli jak pro routers tak pro services stejné, tímto říkáme jakou službu nastavujeme

Více v [Dokumentaci](https://doc.traefik.io/traefik/user-guides/docker-compose/basic-example/)