# home-assistant
My personal Home Assistant setup.

## Supervised machine
Edit `Vagrantfile.supervised` if you want to make any modifications such as changing the synced folder.
The location it's shared with on the guest is where HA expects your configuration dir to be.

Then run the following:
```
VAGRANT_VAGRANTFILE=Vagrantfile.supervised vagrant up
```

Or `cp Vagrantfile.supervised Vagrantfile` then just `vagrant up`.

## HAOS machine
Download the image from here:
https://www.home-assistant.io/installation/windows/

Note the version may have changed since:
```
wget https://github.com/home-assistant/operating-system/releases/download/6.6/haos_ova-6.6.vmdk.zip
```

Set up the VMDK file in the vagrant frontend by following the below directions.
When creating the virtual machine be sure to name it "home-assistant-vm":
https://www.home-assistant.io/installation/windows/#hypervisor-specific-configuration

If you'll also want to be able to SSH into the machine, you'll have to add the key you'll be using to SSH to the machine with
to the `/root/.ssh/authorized_keys` file. You can do this by opening view into the VM via the UI
and when on the `ha>` prompt open a shell using `login`.
Then use `scp` or other means to get the appropriate key onto the HA box.

Once the VM is set up, shut it down and run `./setup_haos_box.sh`.

Then run the following:
```
VAGRANT_VAGRANTFILE=Vagrantfile.haos vagrant up
```

Or `cp Vagrantfile.haos Vagrantfile` then just `vagrant up`.

I'm pretty sure that the networking or other configuration that's done during the manual setup in the UI
doesn't carry over into the box. So there is network configuration in the Vagrantfile.haos.
