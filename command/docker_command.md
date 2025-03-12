### Command ###
# Docker compose alias
docker compose ps --format "table {{.Service}}\t{{.Status}}\t{{.Image}}"
docker compose down && docker compose up -d
docker compose pull
docker compose pull && docker compose up -d
docker compose up -d
docker compose stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"
docker compose logs -f --tail=500