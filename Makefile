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
	docker-compose exec symfony-grpc composer install

upgrade:
	docker-compose exec symfony-grpc composer upgrade

curl:
	curl -vvv localhost && curl -vvv localhost:8080

command:
	docker-compose exec symfony-grpc php bin/console example && docker-compose exec symfony-rest php bin/console example
