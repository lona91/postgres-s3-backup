#!/bin/sh

db_host="postgresql://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME}"
current_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
file="backup_${current_date}.gz"

pg_dump $db_host | gzip > $file

aws s3 cp $file s3://${BUCKET_NAME}/$file