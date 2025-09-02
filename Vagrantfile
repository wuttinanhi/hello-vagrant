Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp-education/ubuntu-24-04"
  config.vm.box_version = "0.1.0"

  # -----
  # https://developer.hashicorp.com/vagrant/tutorials/get-started/provision
  # -----
  # Install Docker and dependencies
  config.vm.provision "shell", name: "install-dependencies", path: "scripts/install-dependencies.sh"

  # Start Terramino (can be rerun with vagrant provision --provision-with start-terramino)
  config.vm.provision "shell", name: "start-terramino", inline: <<-SHELL
    cd /home/vagrant/terramino-go
    docker compose up -d
  SHELL

  # Restart Terramino (can be rerun with vagrant provision --provision-with restart-terramino)
  # For quick changes that doesn't require rebuilding (e.g. frontend changes)
  config.vm.provision "shell", name: "restart-terramino", run: "never", inline: <<-SHELL
    docker compose restart
  SHELL

  # Reload Terramino (can be rerun with vagrant provision --provision-with reload-terramino)
  # For changes that require rebuilding (e.g. backend changes)
  config.vm.provision "shell", name: "reload-terramino", run: "never", inline: <<-SHELL
    /usr/local/bin/reload-terramino
  SHELL

  # -----
  # https://developer.hashicorp.com/vagrant/tutorials/get-started/network-folder-sync#configure-port-forwarding
  # -----
  # Forward ports for Terramino (8081 for frontend, 8080 for backend)
  config.vm.network "forwarded_port", guest: 8080, host: 9080
  config.vm.network "forwarded_port", guest: 8081, host: 9081

  # -----
  # https://developer.hashicorp.com/vagrant/tutorials/get-started/network-folder-sync#enable-folder-synchronization
  # -----
  # Sync the shared-with-vm directory
  config.vm.synced_folder "./shared-with-vm", "/home/vagrant/shared-with-vm", create: true
end
