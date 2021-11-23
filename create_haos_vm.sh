#!/bin/bash
# Note that bridgeadapter may differ

# Note that latest version may differ
wget https://github.com/home-assistant/operating-system/releases/download/6.6/haos_ova-6.6.vmdk.zip
unzip haos_ova-6.6.vmdk.zip

VM_UUID=$(vboxmanage createvm --name haos-vm --default --register --ostype Linux_64 | grep UUID | awk '{print $2}')
vboxmanage modifyvm $VM_UUID --firmware efi --nic1 bridged --bridgeadapter1 enp0s25 --memory 4096
vboxmanage storageattach $VM_UUID --storagectl IDE --port 0 --device 0 --type hdd --medium haos_ova-6.6.vmdk
vboxmanage startvm --type headless $VM_UUID

#vboxmanage showvminfo --machinereadable $VM_UUID --details 
#vboxmanage unregistervm $VM_UUID --delete
