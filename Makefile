NAME= inception

all:
	test -d /home/nflan/data/wordpress || mkdir -p /home/nflan/data/wordpress
	test -d /home/nflan/data/mariadb || mkdir -p /home/nflan/data/mariadb
<<<<<<< HEAD
	docker compose -f srcs/docker-compose.yml up --build --remove-orphans

bonus:
	test -d /home/nflan/data/wordpress || mkdir -p /home/nflan/data/wordpress
	test -d /home/nflan/data/mariadb || mkdir -p /home/nflan/data/mariadb
	test -d /home/nflan/data/redis || mkdir -p /home/nflan/data/redis
	docker compose -f srcs/docker-compose_bonus.yml up --build --remove-orphans

stop:
	docker compose -f srcs/docker-compose.yml stop && docker compose -f srcs/docker-compose_bonus.yml stop
=======
	cd srcs && docker compose up --build

stop:
	cd srcs && docker compose stop
>>>>>>> a681295 (Starting wordpress and get dependances)

fclean: stop
	sudo rm -rf /home/nflan/data/*

.PHONY: stop bonus fclean
