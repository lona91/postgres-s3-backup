FROM python:3.9-alpine

ENV DATABASE_NAME="postgres"
ENV DATABASE_HOST="localhost"
ENV DATABASE_PORT=5432
ENV DATABASE_USERNAME="postgres"
ENV DATABASE_PASSWORD="password" 
ENV AWS_DEFAULT_REGION="eu-central-1"

WORKDIR /opt/backup

RUN ["apk", "add", "build-base", "--no-cache"]
RUN ["apk", "add", "postgresql-client", "--no-cache"]
RUN ["pip3", "install", "awscli"]

COPY backup.sh backup.sh
RUN ["chmod", "a+x", "backup.sh"]

CMD ["sh", "-c", "/opt/backup/backup.sh"]

