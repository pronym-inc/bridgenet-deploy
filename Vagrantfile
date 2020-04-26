# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.synced_folder "src", "/webapps/bridgenet/src"
    config.vm.define "web" do |web|
        web.vm.box = "ubuntu/bionic64"
        web.vm.network "private_network", ip: "192.168.50.50"
        web.vm.provider "virtualbox" do |v|
            v.memory = 2048
        end
        web.vm.provision :ansible_local do |ansible|
            ansible.playbook = "playbook.yml"
            ansible.tags = "initial,initial-vagrant"
            ansible.verbose = true
            ansible.extra_vars = {
                server_name: "bridgenet.local",
                dashboard_server_name: "bndashboard.local",
                listen_port: 80,
                app_username: "vagrant",
                pronym_environment: "vagrant",
                django_git_branch: "develop",
                include_ssl_certs: false,
                copy_ssl_certs: false,
                gunicorn_enabled: false,
                nginx_proxy_url: "http://localhost:8000"
            }
        end
    end
end