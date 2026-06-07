FROM debian:bookworm
LABEL ldevoude="ldevoude@student.42lyon.fr"
LABEL version="1.0"
LABEL description="Wordpress Server"

RUN apt-get -y update && \
    apt-get -y full-upgrade && \
    apt-get -y install wget php-fpm php-mysql mariadb-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html
# Set the working directory to /var/www/html where the WordPress files will be located
WORKDIR /var/www/html

COPY requirements/wordpress/conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY requirements/wordpress/tools/setup_wordpress.sh /usr/local/bin/script.sh
RUN chmod 777 /usr/local/bin/script.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/script.sh"]