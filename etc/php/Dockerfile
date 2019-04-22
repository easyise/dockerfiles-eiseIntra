FROM php:7.1-fpm

RUN apt-get update && apt-get install -y \
curl \
wget \
memcached \
libzip-dev \
libcurl3-dev libldb-dev libldap2-dev libmcrypt-dev libxslt-dev libc-client-dev libkrb5-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
\
&& rm -r /var/lib/apt/lists/* \
&& docker-php-ext-install -j$(nproc) curl ldap mcrypt mysqli xsl \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j$(nproc) gd \
&& docker-php-ext-configure zip --with-libzip \
&& docker-php-ext-install zip

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

WORKDIR /var/www

CMD ["php-fpm"]