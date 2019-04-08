# Base image
FROM alpine:3.9

# Install packages and php
RUN apk --no-cache add php php-fpm php-mysqli \
    php-json php-openssl php-curl \
    php-zlib php-xml php-phar php-intl \
    php-dom php-xmlreader php-ctype \
    php-mbstring php-gd nginx supervisor wget curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Install node
RUN apk update && \
    apk upgrade && \
    apk add nodejs npm

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /etc/php7/conf.d/zzz_custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Creating a new user for nginx and php-fpm
RUN adduser -D -g 'www' www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /var/tmp/nginx \
    && chown -R www:www /var/log/nginx

# Setup document root
RUN mkdir -p /var/www/

# Add application
WORKDIR /var/www/
COPY ./ /var/www/

# Install dependancies
RUN npm install \
    && composer install

# Expose the port nginx is reachable on
EXPOSE 80

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Configure a healthcheck to validate that everything is up&running
HEALTHCHECK --timeout=5s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping