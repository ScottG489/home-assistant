#!/bin/bash
# How this works is:
# 1. Creates a temp project and initializes it so there's a .vagrant dir
# 2. Gets the VM id from the VM you manually created in the UI
# 3. Writes this id to the ID file so that VM is associated with the temp project
# 4. Creates the box file and adds it locally so it can be used in other projects on the local machine
set -ex

HOME_ASSISTANT_VM_NAME=home-assistant-vm
#HOME_ASSISTANT_VM_NAME=home-assistant-vm
HOME_ASSISTANT_BOX_NAME=home-assistant-box
#HOME_ASSISTANT_BOX_NAME=home-assistant-box
BOX_TEMP_DIR=$(mktemp -d)
cd $BOX_TEMP_DIR
vagrant init
vagrant up || true
VBOX_MACHINE_ID=$(VBoxManage list vms \
  | grep $HOME_ASSISTANT_VM_NAME \
  | sed 's/.*{\(.*\)}[^{]*$/\1/')
echo -n $VBOX_MACHINE_ID > .vagrant/machines/default/virtualbox/id
vagrant package --output haos.box
vagrant box add $HOME_ASSISTANT_BOX_NAME file://./haos.box
rm -rf $BOX_TEMP_DIR
