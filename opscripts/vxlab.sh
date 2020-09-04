#!/bin/bash

vms=(n1 n2 n3 n4 n5 n6 n7 h10 h11 h12 h13 h14 h15)

if [ -z $1 ]
then
    echo "operation [start|stop] is required. Exiting."
    exit 1
fi

case "$1" in
    start)
        echo
        echo "Starting all VMs..."
        for vm in "${vms[@]}"
        do
            virsh start $vm
        done
        ;;
    stop)
        echo
        echo "Stopping all VMs..."
        for vm in "${vms[@]}"
        do
            virsh destroy $vm
        done
        ;;
    *)
        echo
        echo "Invalid argument. Valid operations are [start|stop]."
        exit 1
esac

