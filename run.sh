#!/bin/bash
set -e

echo "${CRON_SCHEDULE} /bin/conplicity ${CONPLICITY_OPTIONS}" > /var/spool/cron/crontabs/root

crond -f