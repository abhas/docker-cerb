FROM debian:jessie

COPY cerb/ /var/www/html/
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y php5-mysql \
    php5-curl \
    php5-gd \
    php5-imap \
    php5-cli \
    apache2 \
    libapache2-mod-php5 \
    php-pear \
    php5-dev

RUN pecl install mailparse
RUN chown www-data:www-data -R /var/www/html
RUN cp /var/www/html/.htaccess-dist /var/www/html/.htaccess
RUN echo "upload_tmp_dir=/tmp" >> /etc/php5/apache2/php.ini
RUN echo "extension=mailparse.so" > /etc/php5/mods-available/mailparse.ini
RUN php5enmod mailparse
RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
CMD [ "/usr/sbin/apache2ctl", "-DFOREGROUND" ]
