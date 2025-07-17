# HTTPS Server with Nginx and Docker Compose

This is a template project for serving HTML content over HTTPS using Nginx and Docker Compose.
## Quick Start

```bash
# 1. Copy the example environment file and modify it
cp .env.example .env

# Edit .env to set your SERVER_NAME and HTTPS_PORT

# 2. Generate a self-signed certificate
chmod +x generate-cert.sh
./generate-cert.sh localhost # or your actual server name

# 3. Start the containers
docker compose up -d
```
