include ./srcs/.env
export

all:

	sudo echo "127.0.0.1 $(FDQN)" >> /etc/hosts
	sudo echo "127.0.0.1 www.$(FDQN)" >> /etc/hosts
	mkdir -p $(VOLUME_ROOT)
	chmod 777 $(VOLUME_ROOT)
	cd srcs && sudo docker compose build && sudo docker compose up -d

clean:
	cd srcs && sudo docker compose down

fclean:
	make clean
	sudo docker system prune --all
	sudo rm -rf $(VOLUME_ROOT)

re:
	make fclean
	make all

