#!/bin/bash

# Load environment variables (if present)
if [ -f /home/deploy/pp-traefik/.env.prod ]; then
  source /home/deploy/pp-traefik/.env.prod
fi

# Backup location
BACKUP_DIR="/home/deploy/db_backups/$(date +%F)"
mkdir -p "$BACKUP_DIR"

# DB container name
DB_CONTAINER="prod-pp-shop-db"

# Backup file path
BACKUP_FILE="$BACKUP_DIR/${MYSQL_DATABASE}_backup_$(date +%H-%M).sql.gz"

# Run mysqldump
docker exec "$DB_CONTAINER" sh -c "mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE" | gzip > "$BACKUP_FILE"

# Cleanup old backups
find /home/deploy/db_backups/ -type f -name "*.sql.gz" -mtime +7 -exec rm {} \;

echo "✅ Backup complete: $BACKUP_FILE"
