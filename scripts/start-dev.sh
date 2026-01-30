#!/usr/bin/env bash
set -e #This makes scripts fail fast instead of continuing blindly.

cd pipeline

docker rm -f pg-dtc 2>/dev/null || true #2>/dev/null → silence errors  	• || true → don’t crash the script

docker run -d \
  --name pg-dtc \
  -e POSTGRES_USER="root" \
  -e POSTGRES_PASSWORD="root" \
  -e POSTGRES_DB="ny_taxi" \
  -v $(pwd)/ny_taxi_postgres_data:/var/lib/postgresql \
  -p 5432:5432 \
  postgres:18

sleep 3

echo "Postgres is starting 🚀"
echo "Run: cd pipeline && uv run pgcli -h localhost -p 5432 -u root -d ny_taxi"

