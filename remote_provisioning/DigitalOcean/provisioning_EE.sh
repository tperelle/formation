#!/bin/bash
# Necessite l'installation de doctl : https://github.com/digitalocean/doctl

# load settings
source ./env.sh

# Create VM for each students
itStudent=1
while (( $itStudent <= $FORM_STUDENT_NUMBER ))
do
  # UCP controller
  DROPLET_NAME="$DO_DROPLET_PREFIX-student$itStudent-ucp-controller"
  doctl compute droplet create $DROPLET_NAME --region $DO_REGION \
    --image $DO_IMAGE_ID --size $DO_SIZE_UCPDTR --ssh-keys $DO_SSH_KEY

  # UCP managers
  DROPLET_NAME="$DO_DROPLET_PREFIX-student$itStudent-ucp-manager-0"
  doctl compute droplet create $DROPLET_NAME --region $DO_REGION \
    --image $DO_IMAGE_ID --size $DO_SIZE --ssh-keys $DO_SSH_KEY

  DROPLET_NAME="$DO_DROPLET_PREFIX-student$itStudent-ucp-manager-1"
  doctl compute droplet create $DROPLET_NAME --region $DO_REGION \
    --image $DO_IMAGE_ID --size $DO_SIZE --ssh-keys $DO_SSH_KEY

  # UCP nodes
  DROPLET_NAME="$DO_DROPLET_PREFIX-student$itStudent-ucp-node-0"
  doctl compute droplet create $DROPLET_NAME --region $DO_REGION \
    --image $DO_IMAGE_ID --size $DO_SIZE_UCPDTR --ssh-keys $DO_SSH_KEY

  DROPLET_NAME="$DO_DROPLET_PREFIX-student$itStudent-ucp-node-1"
  doctl compute droplet create $DROPLET_NAME --region $DO_REGION \
    --image $DO_IMAGE_ID --size $DO_SIZE --ssh-keys $DO_SSH_KEY

  let "itStudent+=1"
done

sleep 5s
./summary.sh

# Create ansible host file
itStudent=1
while (( $itStudent <= $FORM_STUDENT_NUMBER ))
do
  echo "[student$itStudent]" >> $ANSIBLE_HOST_FILE
  VM_IDS=$(cat summary.txt | grep $DO_DROPLET_PREFIX-student$itStudent | awk {'print $3'})
  for vm in $VM_IDS; do
    echo "$vm" >> $ANSIBLE_HOST_FILE
  done
  let "itStudent+=1"
done

echo "[student:children]" >> $ANSIBLE_HOST_FILE
itStudent=1
while (( $itStudent <= $FORM_STUDENT_NUMBER ))
do
  echo "student$itStudent" >> $ANSIBLE_HOST_FILE

  let "itStudent+=1"
done

# Execute playbook
sleep 30s
cd playbooks/
ansible-playbook prepare_EE.yml
cd -
