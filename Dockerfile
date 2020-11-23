FROM grpc/php AS symfony-grpc

WORKDIR /app/symfony
VOLUME /app

RUN pecl channel-update pecl.php.net
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/app/symfony/public"]

FROM php:7.3 AS symfony-rest

WORKDIR /app/symfony
VOLUME /app

RUN apt-get update
RUN apt-get install libzip-dev -y
RUN docker-php-ext-configure zip --with-libzip && docker-php-ext-install zip
RUN pecl channel-update pecl.php.net
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/app/symfony/public"]
