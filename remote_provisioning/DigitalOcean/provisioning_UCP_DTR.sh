#!/bin/bash
# Necessite l'installation de doctl : https://github.com/digitalocean/doctl

# load settings
source ./env.sh

# Create VM for UCP and DTR
DROPLET_UCP_NAME="$DO_DROPLET_PREFIX-ucp-node1"
doctl compute droplet create $DROPLET_UCP_NAME --region $DO_REGION \
--image $DO_IMAGE_ID --size $DO_SIZE_UCPDTR --ssh-keys $DO_SSH_KEY


DROPLET_DTR_NAME="$DO_DROPLET_PREFIX-dtr-node1"
doctl compute droplet create $DROPLET_DTR_NAME --region $DO_REGION \
--image $DO_IMAGE_ID --size $DO_SIZE_UCPDTR --ssh-keys $DO_SSH_KEY

sleep 5s
./summary.sh

# Update Ansible inventory
echo "[ucp]" >> $ANSIBLE_HOST_FILE
VM_ID=$(cat summary.txt | grep $DROPLET_UCP_NAME | awk {'print $3'})
echo "$VM_ID" >> $ANSIBLE_HOST_FILE
echo "[dtr]" >> $ANSIBLE_HOST_FILE
VM_ID=$(cat summary.txt | grep $DROPLET_DTR_NAME | awk {'print $3'})
echo "$VM_ID" >> $ANSIBLE_HOST_FILE
