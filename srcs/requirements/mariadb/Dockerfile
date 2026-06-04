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
RUN apt -y install mariadb-server
COPY requirements/mariadb/tools/script_sql.sh /app/tools/script_sql.sh
RUN chmod +x /app/tools/script_sql.sh
#MariaDB default port
EXPOSE 3306
COPY requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

#run to check if container is healthy, if 0 healthcheck is a success, 1 it fails
#mettre dans docker-compose?
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

#entry point = pour finir execute ce script
# cmd = pour finir execute cette commande
CMD ["mariadbd"]

ENTRYPOINT ["/app/tools/script_sql.sh"]

#todebug?
#CMD sleep infinity
#utiliser sh plutot que bash