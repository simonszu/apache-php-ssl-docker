FROM php:7-apache

WORKDIR /var/www/html

RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN openssl req -x509 -nodes -days 36500 -newkey rsa:4096 -keyout /etc/ssl/selfsigned.key -out /etc/ssl/selfsigned.crt -subj "/C=AA/ST=AA/L=Internet/O=Docker/OU=www.simonszu.de/CN=selfsigned" \
    && a2enmod ssl

ADD vhost-ssl.conf /etc/apache2/sites-enabled/

EXPOSE 443
CMD ["apache2-foreground"]
