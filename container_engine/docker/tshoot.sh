
# ==============================================================================
# TROUBLESHOOTING
# ==============================================================================

# --- docker inspect -----------------------------------------------------------

docker inspect <container>                                               # Full inspect
docker inspect <container> --format='{{.State.Status}}'                  # Status
docker inspect <container> --format='{{.State.Pid}}'                     # Host PID
docker inspect <container> --format='{{.State.ExitCode}}'                # Exit code
docker inspect <container> --format='{{.State.OOMKilled}}'               # OOM killed?
docker inspect <container> --format='{{.RestartCount}}'                  # Restarts
docker inspect <container> --format='{{.State.Error}}'                   # Runtime error
docker inspect <container> --format='{{.State.StartedAt}}'               # Start time
docker inspect <container> --format='{{.State.FinishedAt}}'              # Stop time
docker inspect <container> --format='{{.Config.Image}}'                  # Image used
docker inspect <container> --format='{{.HostConfig.RestartPolicy.Name}}' # Restart policy
docker inspect <container> --format='{{.NetworkSettings.IPAddress}}'     # Container IP


# --- Logs ---------------------------------------------------------------------

docker logs <container>                             # Show logs
docker logs -f <container>                          # Follow logs
docker logs --tail 100 <container>                  # Last 100 lines
docker logs --tail 500 <container>                  # Last 500 lines
docker logs --since 10m <container>                 # Logs from last 10 minutes
docker logs --since 1h <container>                  # Logs from last hour
docker logs --since 10m --timestamps <container>    # Recent logs + timestamps
docker logs -f --tail 100 <container>               # Last 100 + follow


# --- Resources ----------------------------------------------------------------

docker stats                                                    # Live resources
docker stats <container>                                        # Specific container
docker stats --no-stream                                        # One-time snapshot
docker stats --no-stream <container>                            # Container snapshot

docker system df                                                # Docker disk usage
docker system df -v                                             # Detailed disk usage

docker ps -s                                                    # Container writable layer sizes

docker inspect <container> --format='{{.HostConfig.Memory}}'    # Memory limit
docker inspect <container> --format='{{.HostConfig.NanoCpus}}'  # CPU limit


# --- Processes ----------------------------------------------------------------

docker top <container>                     # Running processes
docker top <container> aux                 # Detailed process list

docker exec <container> ps aux             # Processes inside container
docker exec <container> top                # Live processes (if available)


# --- Execute / Debug inside container -----------------------------------------

docker exec -it <container> /bin/bash           # Open bash shell
docker exec -it <container> /bin/sh             # Open sh shell
docker exec -u root -it <container> /bin/bash   # Shell as root

docker exec <container> env                     # Environment variables
docker exec <container> hostname                # Container hostname
docker exec <container> cat /etc/hosts          # Hosts file
docker exec <container> cat /etc/resolv.conf    # DNS configuration


# --- Network troubleshooting --------------------------------------------------

docker inspect <container> --format='{{json .NetworkSettings.Networks}}' # Networks

docker port <container>                     # Published ports
docker port <container> 80                  # Mapping for port 80

docker exec <container> ip addr             # Network interfaces
docker exec <container> ip route            # Routing table
docker exec <container> ping <host>         # Test connectivity
docker exec <container> curl -I <url>       # Test HTTP connectivity
docker exec <container> wget -S <url>       # Test HTTP with wget

docker network ls                           # List networks
docker network inspect <network>            # Inspect network


# --- DNS troubleshooting ------------------------------------------------------

docker exec <container> cat /etc/resolv.conf  # DNS configuration
docker exec <container> getent hosts <host>   # Resolve hostname
docker exec <container> nslookup <host>       # DNS lookup (if installed)


# --- Port troubleshooting -----------------------------------------------------

docker port <container>                                               # Published ports

docker inspect <container> --format='{{json .NetworkSettings.Ports}}' # Port mappings

docker exec <container> ss -lntp                                      # Listening TCP ports
docker exec <container> netstat -lntp                                 # Listening ports (if installed)


# --- Mounts / Volumes ---------------------------------------------------------

docker inspect <container> --format='{{json .Mounts}}'              # Container mounts

docker volume ls                                                    # List volumes
docker volume inspect <volume>                                      # Inspect volume

docker exec <container> df -h                                       # Disk usage inside container
docker exec <container> mount                                       # Mounted filesystems


# --- Container changes --------------------------------------------------------

docker diff <container>                    # Files changed in container

# A = Added
# C = Changed
# D = Deleted


# --- Events -------------------------------------------------------------------

docker events                                   # Live Docker events
docker events --since 10m                       # Events from last 10 minutes
docker events --since 1h                        # Events from last hour

docker events --filter container=<container>    # Events for container
docker events --filter event=die                # Container crashes/stops
docker events --filter event=oom                # OOM events


# --- Exit codes ---------------------------------------------------------------

docker inspect <container> --format='{{.State.ExitCode}}'           # Get exit code

# 0   = Success / normal exit
# 1   = Application error
# 125 = Docker command failed
# 126 = Command cannot be executed
# 127 = Command not found
# 137 = SIGKILL / often OOM or docker kill
# 143 = SIGTERM / graceful termination


# --- OOM / Memory -------------------------------------------------------------

docker inspect <container> --format='{{.State.OOMKilled}}'          # Check OOM kill
docker inspect <container> --format='{{.HostConfig.Memory}}'        # Memory limit
docker stats <container>                                            # Current memory usage


# --- Restart troubleshooting --------------------------------------------------

docker inspect <container> --format='{{.RestartCount}}'                  # Restart count

docker inspect <container> --format='{{.HostConfig.RestartPolicy.Name}}' # Restart policy

docker logs --tail 100 <container>                                       # Logs before restart
docker events --filter container=<container>                             # Watch restart events


# --- Health check -------------------------------------------------------------

docker inspect <container> --format='{{.State.Health.Status}}'       # Health status

docker inspect <container> --format='{{json .State.Health}}'         # Full health information

docker inspect <container> --format='{{json .Config.Healthcheck}}'   # Healthcheck configuration


# --- Docker daemon ------------------------------------------------------------

docker info                                # Docker daemon information
docker version                             # Client/server versions
docker context ls                          # Docker contexts
docker context show                        # Current context

docker info --format '{{.ServerVersion}}'  # Docker server version
docker info --format '{{.DockerRootDir}}'  # Docker data directory


# --- Disk cleanup / troubleshooting -------------------------------------------

docker system df                           # Disk usage summary
docker system df -v                        # Detailed disk usage

docker container prune                     # Remove stopped containers
docker image prune                         # Remove dangling images
docker image prune -a                      # Remove unused images
docker volume prune                        # Remove unused volumes
docker network prune                       # Remove unused networks

docker system prune                        # Remove unused Docker data
docker system prune -a                     # More aggressive cleanup
docker system prune -a --volumes           # Cleanup including volumes


# --- Quick troubleshooting workflow -------------------------------------------

docker ps -a                                                                # 1. Check container status
docker inspect <container>                                                  # 2. Inspect configuration/state
docker logs --tail 100 <container>                                          # 3. Check recent logs
docker stats --no-stream <container>                                        # 4. Check CPU/memory
docker top <container>                                                      # 5. Check processes
docker port <container>                                                     # 6. Check exposed ports
docker inspect <container> --format='{{json .Mounts}}'                      # 7. Check mounts
docker inspect <container> --format='{{json .NetworkSettings.Networks}}'    # 8. Check network
docker exec -it <container> /bin/sh                                         # 9. Debug inside container