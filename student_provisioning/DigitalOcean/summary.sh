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
echo "# Cloud : DigitalOcean" >> $SUMMARY_FILE
echo "# Droplet prefix : $DO_DROPLET_PREFIX" >> $SUMMARY_FILE
echo "#######################################################" >> $SUMMARY_FILE
echo " " >> $SUMMARY_FILE

# Environment summary
echo "Machines virtuelles :" >> $SUMMARY_FILE
doctl compute droplet list | grep $DO_DROPLET_PREFIX >> $SUMMARY_FILE

echo " " >> $SUMMARY_FILE

cat $SUMMARY_FILE
