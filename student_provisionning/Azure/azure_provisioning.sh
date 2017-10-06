#!/bin/bash

# load settings
source ./env.sh

# Create dedicated ressources group
az group create --name $AZURE_RESSOURCES_GROUP --location $AZURE_LOCATION

# Create VM for all students
itStudent=1
while (( $itStudent <= $FORM_STUDENT_NUMBER ))
do
  itVm=0
  while (( $itVm < $FORM_STUDENT_VM_NB ))
  do
    VM_NAME="$FORM_NAME-student$itStudent-node$itVm"
    echo "Creating $VM_NAME"
    az vm create --resource-group $AZURE_RESSOURCES_GROUP \
     --name $VM_NAME \
     --image $AZURE_VM_IMAGE \
     --admin-username $AZURE_VM_USER \
     --ssh-key-value $AZURE_VM_PUBLIC_KEY \
     --size $AZURE_VM_SIZE

    let "itVm+=1"
  done

  let "itStudent+=1"
done

./summary.sh
