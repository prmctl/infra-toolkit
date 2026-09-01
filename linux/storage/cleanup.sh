
################################################################################
# Find & CleanUp Big Files
################################################################################
# Step 1: Check filesystem disk usage
df -h

# Step 2: Check inode usage
# A filesystem may be full because of too many small files, even if disk space looks normal.
df -i

# Step 3: Identify which top-level directory is consuming space
# -x keeps du on the same filesystem
# nice/ionice reduce CPU and disk I/O priority for safer production usage
sudo nice -n 19 ionice -c2 -n7 \
du -xhd1 / 2>/dev/null | sort -h

# Step 4: Drill down into the largest directory
# Replace /var with the directory identified in the previous step.
sudo nice -n 19 ionice -c2 -n7 \
du -xhd1 /var 2>/dev/null | sort -h

# Step 5: Continue drilling down as needed
# Example: if /var/log is large
sudo nice -n 19 ionice -c2 -n7 \
du -xhd1 /var/log 2>/dev/null | sort -h

# Step 6: Find files larger than 1 GB inside the suspicious directory
# Replace /var/log with the actual directory you want to inspect.
sudo nice -n 19 ionice -c2 -n7 find /var/log -xdev -type f -size +1G -printf '%s %p\n' 2>/dev/null | sort -nr | head -30 | numfmt --field=1 --to=iec

# Step 7: Check for deleted files that are still held open by running processes
# These files may consume disk space even though they are no longer visible in the filesystem.
sudo lsof +L1

# Step 8: Check which process is using a specific large file
# Replace the path with the actual file path.
sudo lsof /path/to/large-file

# Step 9: If Docker is installed, inspect Docker disk usage
docker system df

# Step 10: Inspect Docker storage directories without deleting anything
sudo nice -n 19 ionice -c2 -n7 \
du -xhd1 /var/lib/docker 2>/dev/null | sort -h

# Step 11: Check logrotate configuration in debug mode
# -d does not rotate or modify logs; it only shows what logrotate would do.
sudo logrotate -d /etc/logrotate.conf

# Step 12: Re-check filesystem usage after any remediation
df -h




# IMPORTANT SAFETY NOTES:
#
# - Do NOT delete files before identifying their owner, process, and purpose.
# - Do NOT run: rm -rf /var/lib/docker/*
# - Do NOT truncate database files, WAL files, container layers, or unknown binary files.
# - If a large file is marked as "(deleted)" in lsof, investigate the owning process/service.
# - Restart or reload a production service only after confirming the operational impact.
# - Prefer inspecting a specific suspicious directory instead of running find across the entire root filesystem.