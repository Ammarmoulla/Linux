#server
sudo apt update && sudo apt install samba -y 
sudo mkdir -p /mnt/inetpub
sudo chmod -R 777 /mnt/inetpub
sudo chown -R nobody:nogroup /mnt/inetpub
sudo nano /etc/samba/smb.conf
sudo ufw allow samba 
[shared]
   path = /mnt/inetpub
   browseable = yes
   read only = no
   guest ok = yes
   force user = nobody
   force group = nogroup

#client
sudo apt install cifs-utils -y 


#cheak
smbclient -L //10.8.0.25 -N

#install on k8s
curl -skSL https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/deploy/install-driver.sh | bash -s master --

kubectl -n kube-system get pod -o wide --watch -l app=csi-smb-controller
kubectl -n kube-system get pod -o wide --watch -l app=csi-smb-node