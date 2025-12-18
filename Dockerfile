FROM python:3.5.10-slim

WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
ENV WORKERS=2 
EXPOSE 5000
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]