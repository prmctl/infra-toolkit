
route del default gw IP
route print
route -n 
route add default gw IPADDR

ip -br a
ip -br addr
ip link
ip route
ip route get 8.8.8.8
ip neigh



printenv

sudo nmap -sn 192.168.1.0/24
sudo mtr --tcp --port 443 google.com
sudo mtr -T -P 443 -r -w -c 10 google.com


whois IPADDR

sudo ip link set eth0 up
sudo ip link set eth0 down


ss -tuna
ss -tuln
sudo ss -tulpn
ss -tn
ss -un


traceroute google.com


curl -o /dev/null -s -w \
'DNS: %{time_namelookup}\nConnect: %{time_connect}\nTLS: %{time_appconnect}\nTTFB: %{time_starttransfer}\nTotal: %{time_total}\n' \
https://google.com


dig google.com
dig +short google.com
dig @8.8.8.8 google.com
dig google.com MX
dig -x 8.8.8.8
dig +trace google.com
dig google.com
dig @8.8.8.8 google.com
resolvectl status
resolvectl query google.com



nc -vz 192.168.1.10 22 80 443


openssl s_client -connect example.com:443
openssl s_client -connect example.com:443 -servername example.com
openssl s_client -connect example.com:443 -servername example.com -showcerts