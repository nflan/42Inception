SRC= /home/nflan/inception/srcs/docker-compose.yml
NAME= inception

all:
	docker compose -f $(SRC) -p $(NAME) build && docker compose -f $(SRC) -p $(NAME) up

stop:
	docker compose -f $(SRC) -p $(NAME) stop

.PHONY: stop

