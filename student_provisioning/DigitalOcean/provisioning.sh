#!/bin/bash
# Necessite l'installation de doctl : https://github.com/digitalocean/doctl

# load settings
source ./env.sh

rm -f $ANSIBLE_HOST_FILE

# Create VM for all students
itStudent=1
while (( $itStudent <= $FORM_STUDENT_NUMBER ))
do
  itVm=0
  while (( $itVm < $FORM_STUDENT_VM_NB ))
  do
    DROPLET_NAME="$DO_DROPLET_PREFIX-student$itStudent-node$itVm"
    doctl compute droplet create $DROPLET_NAME --region $DO_REGION --image $DO_IMAGE_ID --size $DO_SIZE

    let "itVm+=1"
  done

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

# echo "[student:vars]" >> $ANSIBLE_HOST_FILE
# echo "ansible_ssh_private_key_file=$ANSIBLE_SSH_KEY" >> $ANSIBLE_HOST_FILE
# echo "ansible_become_user=$ANSIBLE_REMOTE_USER" >> $ANSIBLE_HOST_FILE
# echo "ansible_become_pass=$ANSIBLE_REMOTE_PASSWD" >> $ANSIBLE_HOST_FILE
