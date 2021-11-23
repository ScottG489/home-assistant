# home-assistant
My personal Home Assistant setup.

## HAOS machine
Verify that the script has the correct version of HAOS and if not update it and commit it back to the repo.
Then run:
```shell
./create_haos_vm.sh
```

This will download the HAOS VMDK file, create a VM with that VMDK attached, and then start it.

If you'll also want to be able to SSH into the machine, you'll have to add the key you'll be using to SSH to the machine with
to the `/root/.ssh/authorized_keys` file.
I'm pretty sure there's a way to get the `ha>` prompt via the UI. Update this doc once it's figured out how to.
Once you have the prompt type `login`.
Then use `scp` or other means to get the appropriate key onto the HA box.
