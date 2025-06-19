# Using the postgresSQL 17 alpine linux image.
FROM postgres:17-alpine3.22


# Copies the setup folder to docker-entrypoint.
COPY setup/ /docker-entrypoint-initdb.d/

# Runs the entrypoint.sh file which walks you through the setup process, you can set up the database with empty tables or have demo data.
RUN chmod +x docker-entrypoint-initdb.d/entrypoint.sh


# This is my first time building a docker image