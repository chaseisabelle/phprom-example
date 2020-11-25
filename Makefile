start:
	make up
	make install
	make ps

stop:
	docker-compose stop

reset:
	make stop
	docker-compose rm -f
	rm -rf symfony-grpc/vendor symfony-grpc/composer.lock symfony-grpc/var/*
	rm -rf symfony-rest/vendor symfony-rest/composer.lock symfony-rest/var/*

restart:
	make reset
	make start

up:
	docker-compose up -d --build --remove-orphans

logs:
	docker-compose logs -f

ps:
	docker-compose ps

install:
	docker-compose exec symfony-grpc composer install && docker-compose exec symfony-rest composer install

upgrade:
	docker-compose exec symfony-grpc composer upgrade && docker-compose exec symfony-rest composer upgrade

curl:
	curl -vvv localhost && curl -vvv localhost:8080

command:
	docker-compose exec symfony-grpc php bin/console example && docker-compose exec symfony-rest php bin/console example
