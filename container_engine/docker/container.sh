
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


# --- docker logs -------------------------------------------------------------

docker logs <container>                    # Show logs
docker logs -f <container>                 # Follow logs in real time
docker logs --tail 100 <container>         # Last 100 lines
docker logs -t <container>                 # Add timestamps
docker logs --since 10m <container>        # Logs from last 10 minutes
docker logs -f --tail 50 <container>       # Last 50 lines + follow


# --- docker inspect -------------------------------------------------------------

docker inspect <container>                                      # Full details
docker inspect <container> --format='{{.State.Status}}'         # Status
docker inspect <container> --format='{{.State.Pid}}'            # Host PID
docker inspect <container> --format='{{.State.ExitCode}}'       # Exit code
docker inspect <container> --format='{{.State.OOMKilled}}'      # OOM status
docker inspect <container> --format='{{.RestartCount}}'         # Restart count
docker inspect <container> --format='{{.State.Error}}'          # Runtime error