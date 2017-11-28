#!/bin/bash
# Necessite l'installation de doctl : https://github.com/digitalocean/doctl

# load settings
source ./env.sh

echo "Snapshots list :"
doctl compute image list
