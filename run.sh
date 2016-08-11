#!/bin/bash
set -e

echo "${CONPLICITY_CRON_SCHEDULE} /bin/conplicity ${CONPLICITY_OPTIONS}" > /var/spool/cron/crontabs/root

crond -f