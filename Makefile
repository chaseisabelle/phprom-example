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
	docker-compose exec symfony composer install

upgrade:
	docker-compose exec symfony composer upgrade

curl:
	curl -vvv localhost

command:
	docker-compose exec symfony php bin/console example

forever:
	./forever.sh
