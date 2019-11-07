cd -- "$(dirname "$BASH_SOURCE")/.."
echo "Your email: "
read email
echo "Your name: "
read name
vagrant ssh -c "sudo sudo -u bridgenet HOME=/home/bridgenet git -C /webapps/bridgenet/src/bridgenet config --global user.email $email"
vagrant ssh -c "sudo sudo -u bridgenet HOME=/home/bridgenet git -C /webapps/bridgenet/src/bridgenet config --global user.name '$name'"
echo "Git config update complete!"