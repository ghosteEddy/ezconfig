### Command ###
# Docker compose
- docker compose ps --format "table {{.Service}}\t{{.Status}}\t{{.Image}}"
- docker compose down && docker compose up -d
- docker compose pull
- docker compose pull && docker compose up -d
- docker compose up -d
- docker compose stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"
- docker compose logs -f --tail=500

# Get container list opened ports
## View all
docker container ls --format "{{.ID}}\t{{.Names}}\t{{.Ports}}"
## Sort by port
docker container ls --format "{{.ID}}\t{{.Names}}\t{{.Ports}}" -a | sort -k3
## Filter for open port only
docker container ls --format "{{.ID}}\t{{.Names}}\t{{.Ports}}" -a | sort -k3 | grep 0.0.0.0: