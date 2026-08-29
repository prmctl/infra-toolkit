# ==============================================================================
# IMAGES
# ==============================================================================

# --- docker images ------------------------------------------------------------

docker images                         # List images
docker images -a                      # List all images
docker images -q                      # Only image IDs
docker images --digests               # Show image digests


# --- docker pull --------------------------------------------------------------

docker pull <image>                    # Pull image
docker pull <image>:<tag>              # Pull specific tag
docker pull --platform linux/amd64 <image>  # Pull for specific platform


# --- docker build -------------------------------------------------------------

docker build -t <image> .              # Build image
docker build -t <image>:<tag> .        # Build with tag
docker build -f <dockerfile> .         # Use specific Dockerfile
docker build --no-cache -t <image> .   # Build without cache
docker build --pull -t <image> .       # Always check for newer base image


# --- docker tag ---------------------------------------------------------------

docker tag <image> <new-image>                    # Create new tag
docker tag <image>:<tag> <image>:<new-tag>        # Add/change tag
docker tag <image> <registry>/<image>:<tag>       # Tag for registry


# --- docker rmi ---------------------------------------------------------------

docker rmi <image>                     # Remove image
docker rmi <image-id>                  # Remove by ID
docker rmi -f <image>                  # Force remove
docker rmi $(docker images -q)         # Remove all images


# --- docker image inspect -----------------------------------------------------

docker image inspect <image>           # Full image details
docker image inspect <image> --format='{{.Id}}'          # Image ID
docker image inspect <image> --format='{{.Architecture}}' # Architecture
docker image inspect <image> --format='{{.Os}}'           # Operating system


# --- docker history -----------------------------------------------------------

docker history <image>                 # Show image layers
docker history --no-trunc <image>      # Show full layer details


# --- docker image prune -------------------------------------------------------

docker image prune                     # Remove dangling images
docker image prune -f                  # Remove without confirmation
docker image prune -a                  # Remove all unused images
docker image prune -a -f               # Remove all unused without confirmation


