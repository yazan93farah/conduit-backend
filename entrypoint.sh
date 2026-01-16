#!/bin/sh
set -e

python manage.py migrate  --noinput
python manage.py collectstatic --noinput
python manage.py createsuperuser --noinput \
  --username "$BACKEND_DJANGO_SUPERUSER_USERNAME" \
  --email "$BACKEND_DJANGO_SUPERUSER_EMAIL" || true

echo "Starting Gunicorn with $BACKEND_WORKERS workers on port 5000"


exec gunicorn \
  -w "$BACKEND_WORKERS" \
  -b "0.0.0.0:5000" \
  conduit.wsgi:application
