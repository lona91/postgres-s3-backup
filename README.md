# Postgres to S3 Backup

Docker container to easly perform backup from a postgres database to an S3 Bucket
[Docker Hub Repository](https://hub.docker.com/r/lona91/postgres-s3-backup)

    $ docker pull lona91/postgres-s3-backup

## How to use

### Docker
    $ docker run -e DATABASE_USERNAME=<postgres_username> -e DATABASE_PASSWORD=<postgres_password> -e DATABASE_NAME=<postgres_db> -e AWS_ACCESS_KEY_ID=<aws_access_key_id> -e AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> -e BUCKET_NAME=<bucket_name> lona91/postgres-s3-backup

### Kubernetes Job
    apiVersion: batch/v1
	kind: Job
	metadata:
	  name: backup-test
	spec:
	  template:
	    spec:
	      containers:
      - name: backup
        image: lona91/postgres-s3-backup:latest
        env:
          - name: DATABASE_NAME
            value: <database_name>
          - name: AWS_ACCESS_KEY_ID
            value: <aws_access_key_id>
          - name: AWS_SECRET_ACCESS_KEY
            value: <aws_secret_access_key>
          - name: DATABASE_HOST
            value: <postgres_service>
          - name: DATABASE_USERNAME
            value: <postgres_username>
          - name: DATABASE_PASSWORD
	        value: <postgres_password>
          - name: BUCKET_NAME
            value: <aws_bucket_name>
      restartPolicy: Never

## Environment variables

| Name | Required | Default
|--|--|--|
| **DATABASE_NAME** | *false* | postgres 
| **DATABASE_HOST** | *false* | localhost
| **DATABASE_PORT** | *false* | 5432
| **DATABASE_USERNAME** | *false* | postgres
| **DATABASE_PASSWORD** | *false* | password 
| **AWS_DEFAULT_REGION** | *false* | eu-central-1
| **AWS_ACCESS_KEY_ID** | *true* |
| **AWS_SECRET_ACCESS_KEY** | *true* |