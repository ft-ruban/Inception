#!/bin/bash
until mysqladmin ping -h mariadb -u ${WORDPRESS_DB_USER} -p${WORDPRESS_DB_PASSWORD} --silent; do
    echo "Waiting for MariaDB..."
    sleep 2
done
cd /var/www/html
if [ ! -f wp-config.php ]; then
    wp core download --allow-root
    wp config create \
        --dbname=${WORDPRESS_DB_NAME} \
        --dbuser=${WORDPRESS_DB_USER} \
        --dbpass=${WORDPRESS_DB_PASSWORD} \
        --dbhost=mariadb:3306 \
        --allow-root
    wp core install \
        --url=${DOMAIN_NAME} \
        --title=${WP_TITLE} \
        --admin_user=${WP_ADMIN} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --allow-root
    wp user create ${WP_USER} ${WP_USER_EMAIL} \
        --user_pass=${WP_USER_PASSWORD} \
        --role=author \
        --allow-root

    
fi
exec php-fpm8.2 -F