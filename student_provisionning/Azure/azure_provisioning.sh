#!/bin/bash

# load settings
source ./env.sh

# Create dedicated ressources group
az group create --name $AZURE_RESSOURCES_GROUP --location $AZURE_LOCATION

# Create VM
az vm create --resource-group $AZURE_RESSOURCES_GROUP \
 --name $AZURE_VM_NAME \
 --image $AZURE_VM_IMAGE \
 --admin-username $AZURE_VM_USER \
 --ssh-key-value $AZURE_VM_PUBLIC_KEY
