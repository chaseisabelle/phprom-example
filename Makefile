start:
	make up
	make install
	make ps

stop:
	docker-compose stop

reset:
	make stop
	docker-compose rm -f
	rm -rf symfony-grpc/vendor symfony-grpc/*.lock symfony-grpc/var/*
	rm -rf symfony-rest/vendor symfony-rest/*.lock symfony-rest/var/*

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
	curl -vvv localhost/metrics && curl -vvv localhost:8080/metrics

command:
	docker-compose exec symfony-grpc php bin/console example && docker-compose exec symfony-rest php bin/console example

topology:
	docker run --rm -it --name dcv -v "$(pwd)":/input pmsipilot/docker-compose-viz render -m image --force docker-compose.yml --output-file=topology.png --no-networks
