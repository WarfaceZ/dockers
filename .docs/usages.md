# How to use

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

## Notes
for xdebug we will use `36589`, in PHPStorm we can use `36589,9003,9000` port