#!/bin/bash

# load settings
source ./env.sh

# Delete ressources group
az group delete --yes --no-wait --name $AZURE_RESSOURCES_GROUP
