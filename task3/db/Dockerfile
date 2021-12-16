FROM postgres:12
COPY init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
ENV POSTGRES_PASSWORD=waves
ENV PGDATA=/var/lib/postgresql/data/pgdata
