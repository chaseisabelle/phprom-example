start:
	make up
	make install
	make ps

up:
	docker-compose up -d --build

logs:
	docker-compose logs -f

ps:
	docker-compose ps

install:
	docker-compose exec symfony composer upgrade

upgrade:
	docker-compose exec symfony composer upgrade


