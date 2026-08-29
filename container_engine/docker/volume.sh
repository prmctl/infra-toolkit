
# ==============================================================================
# VOLUMES
# ==============================================================================

# --- docker volume ls ---------------------------------------------------------

docker volume ls                       # List volumes
docker volume ls -q                    # Only volume names
docker volume ls --filter dangling=true # List unused volumes


# --- docker volume create -----------------------------------------------------

docker volume create <volume>          # Create volume
docker volume create --name <volume>   # Create named volume


# --- docker volume inspect ----------------------------------------------------

docker volume inspect <volume>         # Full volume details
docker volume inspect <volume> --format='{{.Mountpoint}}' # Host mount path
docker volume inspect <volume> --format='{{.Driver}}'     # Volume driver


# --- docker volume rm ---------------------------------------------------------

docker volume rm <volume>              # Remove volume
docker volume rm -f <volume>           # Force remove
docker volume rm $(docker volume ls -q) # Remove all volumes


# --- docker volume prune ------------------------------------------------------

docker volume prune                    # Remove unused volumes
docker volume prune -f                 # Remove without confirmation


# --- volume usage -------------------------------------------------------------

docker run -v <volume>:/data <image>              # Mount named volume
docker run -v /host/path:/container/path <image>  # Bind mount
docker run -v /host/path:/container/path:ro <image> # Read-only bind mount

docker run --mount source=<volume>,target=/data <image> # Mount named volume
docker run --mount type=bind,source=/host/path,target=/data <image> # Bind mount


