FROM debian:bookworm 

LABEL ldevoude="ldevoude@student.42lyon.fr"
LABEL version="1.0"
LABEL description="MariaDB Server"

COPY requirements/mariadb/tools/script_sql.sh /app/tools/script_sql.sh

#upgrade : real production we try to avoid to keep a stable versioning
#--no-install-recomands = to install the strict necessary
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install --no-install-recommends mariadb-server -y && \
rm -rf /var/lib/apt/lists/* && \
chmod +x /app/tools/script_sql.sh

EXPOSE 3306
COPY requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/app/tools/script_sql.sh"]