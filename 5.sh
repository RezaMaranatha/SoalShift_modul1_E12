cat /var/log/syslog | awk 'tolower($0) ~ /cron/ && tolower($0) ~ !/sudo/ {print $0}' | awk 'NF<13'  >> /home/reza/modul1

