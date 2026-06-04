#pas la derniere avant derniere
FROM debian:bookworm 

LABEL ldevoude="ldevoude@student.42lyon.fr"
LABEL version="1.0"
LABEL description="nginx docker"

# CMD ["echo", "Hello, Sunshine!"]

#rm folder that contain apt logs
RUN apt-get -y update && \
apt-get install -y bash && \
apt install -y curl nginx vim openssl && \
apt clean && \
rm -rf /var/lib/apt/lists/* && \
mkdir -p /etc/nginx/ssl && \
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=ARA/L=Charboville/O=42/OU=42/CN=ldevoude.42.fr/UID=ldevoude" && \
mkdir -p /var/run/nginx

#COPY tools/index.html /usr/share/nginx/html/index.html
COPY requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf

# ENV USER=ldevoude
# ENV shell=/bin/bash

#MariaDB default port
#sert a rien ici mettre dans docker-compose.yml
# EXPOSE 443:443
# EXPOSE 80

RUN chmod 777 /var/www/html && \
    chown -R www-data:www-data /var/www/html


#run to check if container is healthy, if 0 healthcheck is a success, 1 it fails
#mettre dans docker-compose?
# HEALTHCHECK --start-period=5m \
#   CMD mariadb -e 'SELECT @@datadir;' || exit 1

#entry point = pour finir execute ce script
# cmd = pour finir execute cette commande
CMD ["nginx", "-g", "daemon off;"]

#todebug?
#CMD sleep infinity
#utiliser sh plutot que bash




#entrypoint