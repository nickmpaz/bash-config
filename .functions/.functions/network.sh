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
