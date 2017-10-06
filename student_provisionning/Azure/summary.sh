#!/bin/bash

# load settings
source ./env.sh

# rm old summary file
SUMMARY_FILE="summary.txt"
rm -f $SUMMARY_FILE
echo " " >> $SUMMARY_FILE
echo "#######################################################" >> $SUMMARY_FILE
echo "# Formation : $FORM_NAME" >> $SUMMARY_FILE
echo "# Formateur : $FORM_TEACHER_NAME ($FORM_TEACHER_MAIL)" >> $SUMMARY_FILE
echo "# Cloud : Azure" >> $SUMMARY_FILE
echo "# Groupe de ressources : $AZURE_RESSOURCES_GROUP" >> $SUMMARY_FILE
echo "#######################################################" >> $SUMMARY_FILE
echo " " >> $SUMMARY_FILE

# Environment summary
echo "Machines virtuelles :" >> $SUMMARY_FILE
vm=$(az vm list --resource-group $AZURE_RESSOURCES_GROUP --query "[*].[name]" --out tsv)
for i in $vm
do
  ip=$(az network public-ip show -g $AZURE_RESSOURCES_GROUP -n ${i}PublicIP --query "[ipAddress]" --out tsv)
  echo "$i $ip" >> $SUMMARY_FILE
done

echo " " >> $SUMMARY_FILE

cat $SUMMARY_FILE
