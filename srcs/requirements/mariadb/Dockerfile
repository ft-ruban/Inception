#pas la derniere avant derniere
FROM debian:bookworm 

LABEL ldevoude="ldevoude@student.42lyon.fr"
LABEL version="1.0"
LABEL description="MariaDB Server"

# CMD ["echo", "Hello, Sunshine!"]

#combine with &&
#rm folder that contain apt logs
RUN apt -y update
RUN apt -y upgrade
#check if right version
RUN install -y mariadb-server-10.3 

#MariaDB default port
EXPOSE 3306
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN service mysql start;
RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
RUN mysql -e "GRAND ALL PRIVILEGES ON \ `${SQL_DATABASE}\`.* TO \ `${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
RUN mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#run to check if container is healthy, if 0 healthcheck is a success, 1 it fails
#mettre dans docker-compose?
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

#entry point = pour finir execute ce script
# cmd = pour finir execute cette commande
CMD ["mariadbd"]

#todebug?
#CMD sleep infinity
#utiliser sh plutot que bash