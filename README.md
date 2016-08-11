# conplicity-cron

Run [conplicity](https://hub.docker.com/r/camptocamp/conplicity/) periodically in a Docker container.

## Getting started

Start Docker container, which triggers every night at 3:30am (default) a backup with conplicity to a AWS S3:

```shell
$ docker run --name backup -ti --detach \
   -v /var/run/docker.sock:/var/run/docker.sock:ro \
   -e AWS_ACCESS_KEY_ID=<key_id> \
   -e AWS_SECRET_ACCESS_KEY=<secret_key> \
   -e CONPLICITY_TARGET_URL=s3://s3-eu-west-1.amazonaws.com/<bucket>/<dir> \
   -e CONPLICITY_CRON_SCHEDULE="30 3 * * *" \
     bkendinibilir/conplicity-cron
```

Better put the credentials in an environment file (e.g. ~/.conplicity.env):

```
AWS_ACCESS_KEY_ID=<key_id>
AWS_SECRET_ACCESS_KEY=<secret_key>
CONPLICITY_CRON_SCHEDULE="30 3 * * *"
CONPLICITY_FULL_IF_OLDER_THAN=15D
CONPLICITY_REMOVE_OLDER_THAN=30D
CONPLICITY_TARGET_URL=s3://s3-eu-west-1.amazonaws.com/<bucket>/<dir>
```

And start:

```shell
$ docker run --name backup -ti --detach \
   -v /var/run/docker.sock:/var/run/docker.sock:ro \
   --env-file=~/.conplicity.env \
     bkendinibilir/conplicity-cron
```
