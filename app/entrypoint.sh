#!/bin/sh

echo "Waiting for postgres..."

while ! nc -z db 5432; do
  sleep 1
done

echo "PostgreSQL started"

python manage.py migrate
python manage.py runserver 0.0.0.0:8888

exec "$@"
