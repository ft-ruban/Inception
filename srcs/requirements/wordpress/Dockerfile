FROM debian:bookworm
LABEL ldevoude="ldevoude@student.42lyon.fr"
LABEL version="1.0"
LABEL description="Wordpress Server"

RUN apt -y update
RUN apt -y full-upgrade
RUN apt-get -y install wget
RUN apt-get -y install -y php7.3 php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN chown -R root:root /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Set the working directory to /var/www/html where the WordPress files will be located
WORKDIR /var/www/html


EXPOSE 9000

ENTRYPOINT["/usr/local/bin/script.sh"]