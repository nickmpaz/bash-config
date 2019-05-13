
#kill all virtual box machines 
function killvms() {
    
    vms=$(VBoxManage list runningvms)

    if (( ${#vms} > 0 )); then
        echo $vms
        VBoxManage list runningvms | awk '{print $2;}' | xargs -I vmid VBoxManage controlvm vmid poweroff
        VBoxManage list vms | awk '{print $2;}' | xargs -I vmid VBoxManage unregistervm --delete vmid
    else 
        echo "no running vms..."
    fi

}


