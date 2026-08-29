
# ==============================================================================
# NETWORKS
# ==============================================================================

# --- docker network ls --------------------------------------------------------

docker network ls                      # List networks
docker network ls -q                   # Only network IDs
docker network ls --filter driver=bridge # Filter by driver


# --- docker network create ----------------------------------------------------

docker network create <network>        # Create bridge network
docker network create --driver bridge <network> # Create bridge network
docker network create --subnet=172.20.0.0/16 <network> # Custom subnet
docker network create --subnet=172.20.0.0/16 --gateway=172.20.0.1 <network> # Custom gateway


# --- docker network inspect ---------------------------------------------------

docker network inspect <network>       # Full network details
docker network inspect <network> --format='{{.Driver}}' # Network driver
docker network inspect <network> --format='{{range .IPAM.Config}}{{.Subnet}}{{end}}' # Subnet


# --- docker network connect ---------------------------------------------------

docker network connect <network> <container> # Connect container to network
docker network connect --alias <alias> <network> <container> # Connect with alias


# --- docker network disconnect ------------------------------------------------

docker network disconnect <network> <container> # Disconnect container
docker network disconnect -f <network> <container> # Force disconnect


# --- docker network rm --------------------------------------------------------

docker network rm <network>            # Remove network
docker network rm $(docker network ls -q) # Remove networks


# --- docker network prune -----------------------------------------------------

docker network prune                   # Remove unused networks
docker network prune -f                # Remove without confirmation


# --- network usage ------------------------------------------------------------

docker run --network <network> <image> # Start container on network
docker run --network host <image>      # Use host network
docker run --network none <image>      # Disable networking

