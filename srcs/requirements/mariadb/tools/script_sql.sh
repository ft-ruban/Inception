#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
mariadb-install-db --auth-root-authentication-method=normal
fi

mysqld_safe &
until mariadb-admin -u root ping 2>/dev/null; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'ldevoude.42.fr' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "UPDATE mysql.user SET Password=PASSWORD('${SQL_ROOT_PASSWORD}') WHERE User='root';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe;
