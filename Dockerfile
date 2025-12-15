FROM python:3.5.10-slim

WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
ENV WORKERS=2 \
    DJANGO_CONTAINER_PORT=5000
EXPOSE 5000
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]