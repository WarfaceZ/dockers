# Introduction

# Commands

## Initialization
```shell
make nginx-init 
```
Prepare `.env` and `docker-compose.yml`

## Start

```shell
make nginx-start 
```

## Stop

```shell
make nginx-stop 
```

## Show logs

```shell
make nginx-logs 
```

## Register domain

```shell
make register-domain
```

Will register domain from template (by default (leave empty) `nginx/sites/templates/template.conf`) and add new line to `/etc/hosts`


## How to use

First time I will start init
```shell
make nginx-init
```

I may add new domain for my project now. For example example.local

```shell
make register-domain
```
- It will ask for domain, `example` in our case
- It will ask for template also, I will use default, so I will take empty (We can add custom templates to `nginx/sites/templates/`)

We are ready for start
```shell
make nginx-start
```
It will start nginx, with php by default (depends on docker-compose).