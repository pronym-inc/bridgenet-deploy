export VAGRANT_GIT_EMAIL=$(shell git config --get user.email)
export VAGRANT_GIT_NAME=$(shell git config --get user.name)

spinup:
	echo "192.168.50.50  bridgenet.local" | sudo tee -a /etc/hosts
	cp ~/.ssh/id_rsa git_ssh_key
	vagrant up
	sleep 5s
	open -a "Google Chrome" http://bridgenet.local
update:
	vagrant ssh -c "sudo sudo -u bridgenet git -C /webapps/bridgenet/src/bridgenet pull"
	vagrant ssh -c "sudo sudo -u bridgenet HOME=/home/bridgenet /webapps/bridgenet/bin/pip install -r /webapps/bridgenet/src/bridgenet/requirements.pip --upgrade"
	vagrant ssh -c "sudo sudo -u bridgenet /webapps/bridgenet/bin/python /webapps/bridgenet/bin/manage.py migrate"