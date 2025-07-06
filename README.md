# 🛡️ Traefik Setup with Docker & GitHub Actions

This repository contains a complete production-ready setup for running [Traefik v3](https://doc.traefik.io/traefik/) in a Docker container on a DigitalOcean droplet, with automatic HTTPS via Let's Encrypt and secured access to the dashboard via HTTP Basic Auth.


## 🚀 Features

- 🐳 Runs Traefik as a Docker container
- 🔐 Secures the dashboard with Basic Auth
- 🌐 Auto HTTPS with Let's Encrypt (TLS Challenge)
- 🛠️ Config updates via GitHub Actions
- 📁 Configurable via YAML (`traefik.yml` and `traefik_dynamic.yml`)
- 📜 Bash scripts for handling database backup

## 📁 Project Structure

```bash
.
├── compose.yaml                  # Docker Compose setup
├── traefik.yml                   # Static Traefik config
├── traefik_dynamic.template.yml # Dynamic config template with env placeholders
├── scripts/
│   └── backup_db.sh             # Optional: database backup script
├── .gitignore
└── .github/
    └── workflows/
        └── deploy.yml           # GitHub Actions deployment workflow (optional)
```

## 📜 Scripts

### backup_db.sh
Generates database backup.
- Loads .env.prod
  - Expects MYSQL_USER, MYSQL_PASSWORD, and MYSQL_DATABASE to be set there.
- Dumps the database from the container
- Stores the backup to the host
  - Compressed .sql.gz file goes into /home/deploy/db_backups/YYYY-MM-DD/
- Deletes old backups
  - Cleans up backups older than 7 days

> [!Note]
> Runs daily at 2:00 AM via cronjob
>
> ```bash
> crontab -e
> 0 2 * * * /home/deploy/pp-traefik/scripts/db-backup.sh >> /home/deploy/db_backups/backup.log 2>&1
> ```

### restore_db.sh
Restores given database backup file.
- Checks that given file exists
- Loads .env.prod
- Imports backup file into database

Run like this:
```bash
./db-restore.sh /home/deploy/db_backups/2025-07-06/{MYSQL_DATABASE}_backup_02-00.sql.gz
```
