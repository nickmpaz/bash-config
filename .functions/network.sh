function localnet() {

    for gate in $(ip r | grep -Eo "default via ([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
    do
        range=${gate%.*}.0/24
        output=$(nmap -sn $range | grep "scan report")
        output=${output//Nmap scan report for /}
        echo "$output" | while read line ; do
            echo $line
        done
        #echo "$output"
    done

}

function gethost() {

    echo $(localnet | grep $1 | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")

}


# get default gateways with ip r.
# scan gateway subnets for active ip's with nmap,
# take those ip's and ping them to flesh out arp table.
# get the arp table row for that ip
# and manually append the hostname with 
# nslookup
function netinfo() {
     
    echo ""
    # for each default gateway
    for gate in $(ip r | grep -Eo "default via ([0-9]{1,3}[\.]){3}[0-9]{1,3}" | grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
    do
        # scan that subnet
        range=${gate%.*}.0/24
        echo -e "Scanning range: $range\n"
        result=$(nmap -F $range)
        mssg="$(echo "$result" | grep "Nmap done:")\n"
        output=$(echo "$result" | grep "scan report" | grep -v "$(hostname)"| grep -Eo "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
        echo -e "$mssg"
        echo "$output" | while read line ; do
            address=$line
            ping -c 1 $address > /dev/null 2>&1
            arp="$(arp -en $address | grep -v "Address" | grep -v "no entry")"
            host="$(nslookup $address | grep -o "=.*" | head -n 1 | grep -o "[^= ]*")"
            [[ !  -z  $host  ]] && host=$(echo $host | sed 's/\.$//')
            echo -e "$arp\t$host\n"
        done
    done
        

}
