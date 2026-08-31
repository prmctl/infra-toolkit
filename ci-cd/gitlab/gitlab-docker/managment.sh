
# Log Path
docker inspect --format='{{.LogPath}}' gitlab-ce

# Clean Log
truncate -s 0 "$(docker inspect --format='{{.LogPath}}' gitlab-ce)"