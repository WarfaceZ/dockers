.PHONY: nginx-init nginx-start nginx-stop nginx-logs register-domain

nginx-init:
	(cd nginx/ && make init 1> /dev/null)

nginx-start:
	(cd nginx/ && make start)

nginx-stop:
	(cd nginx/ && make stop)

nginx-logs:
	(cd nginx/ && make logs)

register-domain:
	(cd nginx/ && make register-domain)