echo "===== Allocated Resources ====="; \
echo "vCPU: $(nproc)"; \
echo "RAM: $(free -h | awk '/Mem:/ {print $2}')"; \
echo "Disk: $(df -h / | awk 'NR==2 {print $2}')"; \
echo; \
echo "===== Current Usage ====="; \
top -bn1 | awk '/Cpu\(s\)/{printf "CPU: %.1f%%\n",100-$8}'; \
free -h | awk '/Mem:/ {print "RAM: "$3" / "$2" ("int($3/$2*100)"%)"}'; \
df -h / | awk 'NR==2 {print "Disk: "$3" / "$2" ("$5")"}'