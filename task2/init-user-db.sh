#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER django;
    CREATE DATABASE django;
    GRANT ALL PRIVILEGES ON DATABASE django TO django;
    ALTER ROLE django WITH PASSWORD 'django';
EOSQL
