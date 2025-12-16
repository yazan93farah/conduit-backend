#!/bin/sh
set -e

python manage.py migrate  --noinput
python manage.py collectstatic --noinput
python manage.py createsuperuser --noinput \
  --username "$DJANGO_SUPERUSER_USERNAME" \
  --email "$DJANGO_SUPERUSER_EMAIL" || true

echo "Starting Gunicorn with $WORKERS workers on port $DJANGO_CONTAINER_PORT"


exec gunicorn \
  -w "$WORKERS" \
  -b "0.0.0.0:$DJANGO_CONTAINER_PORT" \
  conduit.wsgi:application
