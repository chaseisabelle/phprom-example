FROM grpc/php

WORKDIR /app/symfony
VOLUME /app

RUN pecl channel-update pecl.php.net
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/app/symfony/public"]
