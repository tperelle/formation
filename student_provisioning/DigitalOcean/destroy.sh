#!/bin/bash
# Necessite l'installation de doctl : https://github.com/digitalocean/doctl

# load settings
source ./env.sh

./summary.sh

# Delete VM for all students
VM_IDS=$(cat summary.txt | grep Thomas-Form-LBN-student | awk {'print $1'})
for vm in $VM_IDS; do
    echo "Suppression droplet : $vm"
    doctl compute droplet delete $vm -f
done

sleep 5s

./summary.sh
