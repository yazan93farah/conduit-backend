FROM python:3.5.10-slim

WORKDIR /app
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install -r requirements.txt
ENV WORKERS=2 
EXPOSE 5000
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]