
# ==============================================================================
# TROUBLESHOOTING
# ==============================================================================

# --- docker inspect ----------------------------------------------------------

docker inspect <container>                                      # Full inspect
docker inspect <container> --format='{{.State.Status}}'         # Status
docker inspect <container> --format='{{.State.ExitCode}}'       # Exit code
docker inspect <container> --format='{{.State.OOMKilled}}'      # OOM killed?
docker inspect <container> --format='{{.RestartCount}}'         # Restarts


# --- Resources ---------------------------------------------------------------

docker stats                              # Live resources
docker stats <container>                  # Specific container
docker stats --no-stream                  # One-time snapshot
docker system df                          # Docker disk usage
docker system df -v                       # Detailed disk usage
