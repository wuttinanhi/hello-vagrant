Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp-education/ubuntu-24-04"
  config.vm.box_version = "0.1.0"

  # -----
  # https://developer.hashicorp.com/vagrant/tutorials/get-started/provision
  # -----
  # Install Docker and dependencies
  config.vm.provision "shell", name: "install-dependencies", path: "scripts/install-dependencies.sh"


  # # Start Terramino (can be rerun with vagrant provision --provision-with start-terramino)
  # config.vm.provision "shell", name: "start-terramino", inline: <<-SHELL
  #   cd /home/vagrant/terramino-go
  #   docker compose up -d
  # SHELL

  # # Restart Terramino (can be rerun with vagrant provision --provision-with restart-terramino)
  # # For quick changes that doesn't require rebuilding (e.g. frontend changes)
  # config.vm.provision "shell", name: "restart-terramino", run: "never", inline: <<-SHELL
  #   docker compose restart
  # SHELL

  # # Reload Terramino (can be rerun with vagrant provision --provision-with reload-terramino)
  # # For changes that require rebuilding (e.g. backend changes)
  # config.vm.provision "shell", name: "reload-terramino", run: "never", inline: <<-SHELL
  #   /usr/local/bin/reload-terramino
  # SHELL

  # Start Terramino (can be rerun with vagrant provision --provision-with start-terramino)
  # Visit http://192.168.56.10:9080/
  # Visit http://192.168.56.10:9081/
  # config.vm.provision "shell", name: "start-terramino", inline: <<-SHELL
  #   docker run -d -p 6379:6379 --name redis redis:alpine
  #   docker run -d -p 8081:8081 --name frontend ghcr.io/hashicorp-education/terramino-go/terramino-go-frontend:1.0
  #   docker run -d -p 8080:8080 --name backend -e REDIS_HOST=redis -e REDIS_PORT=6379 -e TERRAMINO_PORT=8080 ghcr.io/hashicorp-education/terramino-go/terramino-go-backend:1.0
  # SHELL


  # -----
  # https://developer.hashicorp.com/vagrant/tutorials/get-started/network-folder-sync#configure-port-forwarding
  # -----
  # Forward ports for Terramino (8081 for frontend, 8080 for backend)
  # config.vm.network "forwarded_port", guest: 8080, host: 8080
  # config.vm.network "forwarded_port", guest: 8081, host: 8081
  # config.vm.network "forwarded_port", guest: 6379, host: 6379


  # -----
  # https://developer.hashicorp.com/vagrant/tutorials/get-started/network-folder-sync#enable-folder-synchronization
  # -----
  # Sync the shared-with-vm directory
  config.vm.synced_folder "./shared-with-vm", "/home/vagrant/shared-with-vm", create: true


  # Start Terramino (can be rerun with vagrant provision --provision-with start-terramino)
  # Visit http://192.168.56.10:8080/
  # Visit http://192.168.56.10:8081/
  config.vm.define "terramino" do |terramino|
    terramino.vm.hostname = "terramino"
    terramino.vm.network "private_network", ip: '192.168.56.10'
    terramino.vm.network "forwarded_port", guest: 8080, host: 8080
    terramino.vm.network "forwarded_port", guest: 8081, host: 8081
    terramino.vm.network "forwarded_port", guest: 6379, host: 6379

    terramino.vm.provision "shell", name: "start-terramino", inline: <<-SHELL
      docker run -d -p 6379:6379 --name redis --restart always redis:alpine
      docker run -d -p 8081:8081 --name frontend --restart always ghcr.io/hashicorp-education/terramino-go/terramino-go-frontend:1.0
      docker run -d -p 8080:8080 --name backend --restart always -e REDIS_HOST=redis -e REDIS_PORT=6379 -e TERRAMINO_PORT=8080 ghcr.io/hashicorp-education/terramino-go/terramino-go-backend:1.0
    SHELL
  end

  
  # Nginx Server
  # Visit http://192.168.56.11/
  config.vm.define "nginx" do |nginx|
    nginx.vm.hostname = "nginx"
    nginx.vm.network "private_network", ip: '192.168.56.11'
    nginx.vm.network "forwarded_port", guest: 80, host: 8082

    # nginx.vm.synced_folder "./nginx/terramino-go", "/home/vagrant/terramino-go", create: true

    nginx.vm.provision "shell", name: "start-nginx", inline: <<-SHELL
      docker run -d \
        -p 80:80 \
        --restart always \
        --name "nginx" \
        nginx
    SHELL
  end
  

  # Apache Server
  # Visit http://192.168.56.12/
  config.vm.define "apache" do |apache|
    apache.vm.hostname = "apache"
    apache.vm.network "private_network", ip: '192.168.56.12'
    apache.vm.network "forwarded_port", guest: 80, host: 8083

    # vagrant provision --provision-with start-apache
    apache.vm.provision "shell", name: "start-apache", inline: <<-SHELL
      docker run -d -p 80:80 --restart always --name "apache" httpd:2.4.65
    SHELL
  end
end
