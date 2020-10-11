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
    - look in `/symfony` for the php app
- `phprom` the [phprom server](https://github.com/chaseisabelle/phprom)
- `prometheus` a [prometheus](https://prometheus.io/) instance
    - see `prometheus.yaml` for configs
    - navigate to `localhost:9090` for ui
- `grafana`
    1. navigate to `localhost:3000` for ui
    2. login with
        - username: admin
        - password: admin
    3. click "add data source"
    4. select "prometheus"
    5. set the URL to "http://prometheus:9090"
    6. click "save & test"
    7. click the big + on the left-hand side
    8. click "import"
    9. click "upload json file"
    10. select `grafana.json`
