#!/bin/bash

# Formation settings
export FORM_NAME="LBN"
export FORM_TEACHER_NAME="Thomas"
export FORM_TEACHER_MAIL="t.perelle@treeptik.fr"
export FORM_STUDENT_NUMBER=1
export FORM_STUDENT_VM_NB=4

# Azure ressources group settings
export AZURE_RESSOURCES_GROUP="$FORM_TEACHER_NAME-Form-$FORM_NAME"
export AZURE_LOCATION="westeurope"

# Azure VM settings
export AZURE_VM_IMAGE="UbuntuLTS"
export AZURE_VM_USER="student"
export AZURE_VM_PUBLIC_KEY="~/.ssh/id_rsa_formation.pub"
export AZURE_VM_SIZE="Standard_A1"
