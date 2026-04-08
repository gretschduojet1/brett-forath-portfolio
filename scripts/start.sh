#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}${CYAN}Brett Forath — Portfolio${RESET}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""

# Copy .env if it doesn't exist
if [ ! -f "$ROOT/.env" ]; then
  echo -e "${YELLOW}No .env found — copying from .env.example...${RESET}"
  cp "$ROOT/.env.example" "$ROOT/.env"
  echo -e "${YELLOW}  → Edit .env and set a real SECRET_KEY before deploying to production.${RESET}"
  echo ""
fi

# Check docker is running
if ! docker info > /dev/null 2>&1; then
  echo -e "${YELLOW}Docker is not running. Please start Docker Desktop and try again.${RESET}"
  exit 1
fi

echo -e "${GREEN}Starting services...${RESET}"
echo ""

docker compose -f "$ROOT/docker-compose.yml" up --build -d

echo ""
echo -e "${GREEN}${BOLD}All services are up!${RESET}"
echo ""
echo -e "  ${BOLD}Frontend${RESET}   →  ${CYAN}http://localhost:5173${RESET}"
echo -e "  ${BOLD}Backend${RESET}    →  ${CYAN}http://localhost:8000${RESET}"
echo -e "  ${BOLD}API Docs${RESET}   →  ${CYAN}http://localhost:8000/docs${RESET}"
echo ""
echo -e "${YELLOW}Tip:${RESET} To follow logs run:  docker compose logs -f"
echo -e "${YELLOW}Tip:${RESET} To stop run:          docker compose down"
echo ""
