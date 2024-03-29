FROM composer:2 AS composer

FROM php:8.1-cli
COPY --from=composer /usr/bin/composer /usr/bin/composer

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup --gid ${GID} --system developer
RUN adduser --gid ${GID} --uid ${UID} --system --disabled-password developer
RUN usermod -a -G www-data developer
RUN usermod -a -G developer www-data

RUN apt-get update && apt-get install -y \
        git \
        libicu-dev \
        gcc \
        curl \
        libcurl4 \
        libcurl4-openssl-dev \
        zip \
        unzip \
        git \
        zlib1g-dev \
		libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
        postgresql \
        libpq-dev \
        icu-devtools \
        gettext \
        locales \
        build-essential \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        libgmp-dev \
        libsodium-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) gd pgsql gmp intl sodium pdo mbstring simplexml xmlwriter zip gettext curl bcmath exif \
    && docker-php-ext-enable gd pgsql gmp sodium mbstring curl intl gettext simplexml xmlwriter zip bcmath exif

RUN git config --global safe.directory '*'
