#!/bin/bash
# shell script to build home cumulus vx lab from scratch on ubuntu 20 workstation

network_vms=(n1 n2 n3 n4 n5 n6 n7)
host_vms=(h10 h11 h12 h13 h14 h15)

echo Download, extract, and convert to qcow2
# method 1 - download ova and extract
wget https://d2cd9e7ca6hntp.cloudfront.net/public/CumulusLinux-4.2.0/cumulus-linux-4.2.0-vx-amd64-vmware.ova
# method 2 - download qcow2
#wget https://d2cd9e7ca6hntp.cloudfront.net/public/CumulusLinux-4.2.0/cumulus-linux-4.2.0-vx-amd64-qemu.qcow2

tar xvf cumulus-linux-4.2.0-vx-amd64-vmware.ova
qemu-img convert -O qcow2 cumulus-linux-4.2.0-vx-amd64-1594775435.dirtyzc24426ca-disk1.vmdk cumulus-vx-master.qcow2

echo Build bridges required for inter-vm links
./buildbridges.sh

echo Instantiate Cumulus VX nodes
for netvm in "${network_vms[@]}"
do
    echo "....building $netvm."
    cp cumulus-vx-master.qcow2 /var/lib/libvirt/images/$netvm.qcow2
    virsh define vmtemplates/$netvm.xml
done

echo Instantiate host nodes
for hostvm in "${host_vms[@]}"
do
    echo "....building $hostvm."
    cp debian-host-master.qcow2 /var/lib/libvirt/images/$hostvm.qcow2
    virsh define vmtemplates/$netvm.xml
done
