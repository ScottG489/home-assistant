Vagrant.configure("2") do |config|
  config.vm.box = "bento/debian-11"
  config.vm.hostname = "home-assistant-vm"

  #config.vm.network "public_network", bridge: "enp0s25"

  config.vm.network "forwarded_port", guest: 8123, host: 8123
  config.vm.network "forwarded_port", guest: 4357, host: 4357

  #config.vm.synced_folder "/home/scott/home-assistant/ha_config", "/usr/share/hassio/homeassistant"

  config.vm.provision "shell", path: "./install_supervisor.sh"
end
