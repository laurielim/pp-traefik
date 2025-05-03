# 🛡️ Traefik Setup with Docker & GitHub Actions

This repository contains a complete production-ready setup for running [Traefik v3](https://doc.traefik.io/traefik/) in a Docker container on a DigitalOcean droplet, with automatic HTTPS via Let's Encrypt and secured access to the dashboard via HTTP Basic Auth.

---

## 🚀 Features

- 🐳 Runs Traefik as a Docker container
- 🔐 Secures the dashboard with Basic Auth
- 🌐 Auto HTTPS with Let's Encrypt (TLS Challenge)
- 🛠️ Config updates via GitHub Actions
- 📁 Configurable via YAML (`traefik.yml` and `traefik_dynamic.yml`)

---

## 📁 Project Structure

```bash
.
├── traefik.yml                  # Static Traefik configuration
├── traefik_dynamic.template.yml # Template with placeholder for secret
├── traefik_dynamic.yml          # Generated config with injected secret
├── docker-compose.yml           # Docker setup for Traefik
└── .
