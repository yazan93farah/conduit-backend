FROM python:3.5.10-slim

WORKDIR /app
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
 && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install -r requirements.txt
ENV BACKEND_WORKERS=2 
EXPOSE 5000
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]