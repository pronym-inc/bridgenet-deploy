# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.synced_folder "src", "/webapps/bridgenet/src"
    config.vm.define "all_in_one" do |web|
        web.vm.box = "ubuntu/bionic64"
        web.vm.network "private_network", ip: "192.168.50.50"
        web.vm.provider "virtualbox" do |v|
            v.memory = 2048
        end
        web.vm.provision :ansible_local do |ansible|
            ansible.playbook = "playbook.yml"
            ansible.tags = "initial"
            ansible.verbose = true
            ansible.extra_vars = {
                username: "vagrant",
                pronym_environment: "vagrant",
                server_name: "bridgenet.local",
                is_vagrant: true,
                django_app_git_branch: "develop",
                django_static_enable_webpack_packaging: false,
                nginx_include_ssl_certs: false,
                nginx_listen_port: 80,
                secrets_api_token: "#{ENV['PRONYM_SECRETS_TOKEN']}",
                secrets_download_local_dev_secrets: true,
                bridgenet_dashboard_server_name: "bndashboard.local"
            }
        end
    end
end