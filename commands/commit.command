cd -- "$(dirname "$BASH_SOURCE")/.."
vagrant ssh -c "sudo sudo -u bridgenet HOME=/home/bridgenet git -C /webapps/bridgenet/src/bridgenet add /webapps/bridgenet/src/bridgenet"
echo "Enter commit message:"
read commitmsg
vagrant ssh -c "sudo sudo -u bridgenet HOME=/home/bridgenet git -C /webapps/bridgenet/src/bridgenet commit -am '$commitmsg'"
vagrant ssh -c "sudo sudo -u bridgenet HOME=/home/bridgenet git -C /webapps/bridgenet/src/bridgenet push"
echo "Git commit complete!"