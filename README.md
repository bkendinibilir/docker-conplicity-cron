# conplicity-cron

Run [conplicity](https://hub.docker.com/r/camptocamp/conplicity/) periodically in a Docker container.

## Getting started

Start Docker container, which triggers every night at 3:30am a backup with conplicity to a AWS S3 bucket:

```shell
$ docker run --name backup -ti --detach -v /var/run/docker.sock:/var/run/docker.sock:ro \
   -e CONPLICITY_TARGET_URL=s3://s3-eu-west-1.amazonaws.com/<my_bucket>/<my_dir> \
   -e AWS_ACCESS_KEY_ID=<my_key_id> \
   -e AWS_SECRET_ACCESS_KEY=<my_secret_key> \
   -e CRON_SCHEDULE="30 3 * * *" \
     bkendinibilir/conplicity-cron
```