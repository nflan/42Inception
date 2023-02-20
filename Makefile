SRC= /home/nflan/inception/srcs/docker-compose.yml
NAME= inception

all:
	test -d /home/nflan/data/wordpress || mkdir -p /home/nflan/data/wordpress
	test -d /home/nflan/data/mariadb || mkdir -p /home/nflan/data/mariadb
	cd srcs && docker compose up --build

stop:
	cd srcs && docker compose stop

fclean:
	make stop
	sudo rm -rf /home/nflan/data/* y

.PHONY: stop

