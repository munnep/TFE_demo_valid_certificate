Vagrant.configure("2") do |config|

    config.vm.box = "bento/ubuntu-20.04"

    config.vm.hostname = "TFE-demo-auto"
    config.vm.network "private_network", ip: "192.168.56.33"

    config.vm.provision "shell", path: "vagrant_scripts/configure_tfe_settings.sh"
    config.vm.provision "shell", path: "vagrant_scripts/configure_replicated.sh"

    config.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
    end
    
end