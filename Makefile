NAME= inception

all:
	cd srcs && docker compose -p $(NAME) build && docker compose -p $(NAME) up

stop:
	cd srcs && docker compose -p $(NAME) stop

.PHONY: stop

