
#SSL that load  form doamin in nginx 
sudo nginx -T 2>/dev/null | grep -n -B5 -A15 'server_name cdn.samyarsafar.ir'

#top rated path and endpoints
awk -F'"' '{print $2}' access.log | awk '{print $2}' | cut -d'?' -f1 | sort | uniq -c | sort -nr | head -50

# request for each  ip -- OK
awk '{print $1}' access.log | sort | uniq -c | sort -nr

# request for each  ip  in a date 
awk '$4 ~ /\[23\/Aug\/2026:23:/ {count[$1]++} END {for (ip in count) print ip, count[ip]}' access.log | sort -k2 -nr

awk '$4 ~ /:(22|23):/ {count[$1]++} END {for (ip in count) print ip, count[ip]}' access.log | sort -k2 -nr

awk '
/wv\)/ && (/\"GET \/ HTTP/ || /request=\"GET \/ HTTP/) {
    # IP
    if ($0 ~ /remote_addr="/) {
        match($0, /remote_addr="([^"]+)"/, m)
        ip=m[1]
    } else {
        ip=$1
    }

    # Date
    match($0, /[0-9][0-9]\/[A-Za-z][A-Za-z][A-Za-z]\/[0-9][0-9][0-9][0-9]/, d)
    date=d[0]

    # Device model
    device="Unknown"
    if (match($0, /Android [^;]+; ([^;)]+)( Build\/[^;)]*)?; wv/, x))
        device=x[1]

    gsub(/ Build.*/, "", device)

    key=date "|" ip "|" device
    count[key]++
    total[date]++

    uniqueKey=date "|" ip "|" device
    unique[uniqueKey]=1
}
END {
    print "DATE | IP | DEVICE | VISITS"
    print "-----------------------------------------------"

    for (k in count) {
        split(k,a,"|")
        printf "%s | %s | %s | %d\n", a[1],a[2],a[3],count[k]
    }

    print "\nSUMMARY"
    print "-----------------------------------------------"

    for (d in total) {
        u=0
        prefix=d "|"

        for (k in unique)
            if (index(k,prefix)==1)
                u++

        printf "%s | TOTAL=%d | UNIQUE=%d\n",d,total[d],u
    }
}' on.megagasht.com.access.log
