#server
sudo apt update
sudo apt install -y nfs-kernel-server
sudo mkdir -p /mnt/nfs-share
sudo chmod -R 777 /mnt/nfs-share
echo "/mnt/nfs-share *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
sudo exportfs -rav
sudo systemctl restart nfs-server


#client
sudo apt update && sudo apt install -y nfs-common
showmount -e 172.17.113.153
