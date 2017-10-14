#!/bin/bash
# Necessite l'installation de doctl : https://github.com/digitalocean/doctl

# load settings
source ./env.sh

# Create VM for UCP and DTR
DROPLET_UCP_NAME="$DO_DROPLET_PREFIX-ucp-node1"
doctl compute droplet create $DROPLET_UCP_NAME --region $DO_REGION --image $DO_IMAGE_ID --size $DO_SIZE_UCPDTR

DROPLET_DTR_NAME="$DO_DROPLET_PREFIX-dtr-node1"
doctl compute droplet create $DROPLET_DTR_NAME --region $DO_REGION --image $DO_IMAGE_ID --size $DO_SIZE_UCPDTR

sleep 5s
./summary.sh
