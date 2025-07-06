#!/bin/bash

BACKUP_FILE=$1

if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: $0 path/to/backup.sql.gz"
  exit 1
fi

source /home/deploy/pp-traefik/.env.prod

docker exec -i prod-pp-shop-db mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < <(gunzip -c "$BACKUP_FILE")

echo "✅ Restore complete from $BACKUP_FILE"
