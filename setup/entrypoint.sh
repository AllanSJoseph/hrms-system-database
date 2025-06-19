#!/bin/bash

set -e

echo "Setting Up The Database for you"

echo "Setting Up the tables..."

if psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/sqlscripts/hrmstables.sql; then
    echo "Successfully created tables!!"
else
    echo "Failed Setting up the tables :("
    echo "Please raise issue to the repository!"
    exit 1
fi

if $POPULATE_DEMO = "true"; then
    echo "Populating the tables..."
    if psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /docker-entrypoint-initdb.d/sqlscripts/hrmspopulate.sql; then
        echo "Successfully populated tables!!"
    else 
        echo "Failed to populate tables :("
        echo "Please raise issue to the repository!"
        exit 1
    fi
else
    echo "Skipped Populating Tables... Your tables are empty..."

fi

echo "Finished setting up!!"
