FROM mysql
ENV MYSQL_ROOT_HOST='%' \
    MYSQL_ROOT_PASSWORD='raven123'

COPY *.sql /docker-entrypoint-initdb.d/

EXPOSE 3306 33060
