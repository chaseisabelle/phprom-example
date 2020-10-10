# example symfony app for phprom bundle
docker example for [phprom bundle](https://github.com/chaseisabelle/phprom-bundle)

---
### usage

- `make start` to build, install, and run
- `make up` to build and run
- `make logs` to see the logs
- `make ps` alias for `docker-compose ps`
- `make install` to install composer dependencies
- `make upgrade` to upgrade composer dependencies
- `make curl` to hit the `GET /metrics` endpoint
- `make command` to run the symfony example command

---
### containers

- `symfony` the php [symfony app](https://symfony.com)
- `phprom` the [phprom server](https://github.com/chaseisabelle/phprom)
- 
