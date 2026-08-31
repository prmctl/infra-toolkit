
echo "===== Top 10 CPU ====="; \
ps -eo pid,user,comm,%cpu,%mem --sort=-%cpu | head -11; \
echo; \
echo "===== Top 10 RAM ====="; \
ps -eo pid,user,comm,%mem,rss,%cpu --sort=-%mem | head -11