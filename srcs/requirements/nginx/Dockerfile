FROM debian:bookworm 

LABEL ldevoude="ldevoude@student.42lyon.fr"
LABEL version="1.0"
LABEL description="nginx docker"

RUN apt-get -y update && \
apt-get install -y --no-install-recommends bash curl nginx openssl && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
mkdir -p /etc/nginx/ssl && \
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=ARA/L=Charboville/O=42/OU=42/CN=ldevoude.42.fr/UID=ldevoude" && \
mkdir -p /var/run/nginx

COPY requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
