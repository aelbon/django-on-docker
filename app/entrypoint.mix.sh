#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    # wait until nc (netcat) can connect to the PostgreSQL host and port
    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"
fi

# clear the database without asking for confirmation
python manage.py flush --no-input

# apply all migrations
python manage.py migrate

# collect all static files in the STATIC_ROOT directory
# (without asking for confirmation and clearing the existing files)
python manage.py collectstatic --no-input --clear

# execute the command passed as arguments to this script
# (i.e. the command to start the server as specified in the docker-compose.yml file)
exec "$@"
