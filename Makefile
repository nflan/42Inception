SRC= /home/nflan/inception/srcs/docker-compose.yml
NAME= inception

all:
	test -d /home/nflan/data/wordpress || mkdir -p /home/nflan/data/wordpress
	test -d /home/nflan/data/mariadb || mkdir -p /home/nflan/data/mariadb
	docker compose -f srcs/docker-compose.yml up --build

stop:
	docker compose -f srcs/docker-compose.yml stop

fclean:
	make stop
	sudo rm -rf /home/nflan/data/*

.PHONY: stop

