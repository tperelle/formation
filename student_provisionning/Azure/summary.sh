#!/bin/bash

# load settings
source ./env.sh

# rm old summary file
SUMMARY_FILE="summary.txt"
rm -f $SUMMARY_FILE

# Environment summary
vm=$(az vm list --resource-group $AZURE_RESSOURCES_GROUP --query "[*].[name]" --out tsv)
for i in $vm
do
  ip=$(az network public-ip show -g $AZURE_RESSOURCES_GROUP -n ${i}PublicIP --query "[ipAddress]" --out tsv)
  echo "$i $ip" >> $SUMMARY_FILE
done

cat $SUMMARY_FILE
