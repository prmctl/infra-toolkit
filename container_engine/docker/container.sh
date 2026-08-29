
# ==============================================================================
# CONTAINERS
# ==============================================================================

# --- docker ps ---------------------------------------------------------------

docker ps                  # Running containers
docker ps -a               # All containers
docker ps -q               # Only running container IDs
docker ps -aq              # IDs of all containers
docker ps -l               # Latest created container
docker ps -s               # Show container sizes


# --- docker start / stop / restart -------------------------------------------

docker start <container>                 # Start
docker stop <container>                  # Graceful stop
docker stop -t 30 <container>            # Stop with 30s timeout
docker restart <container>               # Restart
docker kill <container>                  # Force kill


