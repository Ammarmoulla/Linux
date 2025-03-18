sudo adduser runner # password is runner
sudo usermod -aG sudo runner
su -s /bin/bash runner # test without sudo
su - runner

#step ssh
ssh-keygen 
#Copy the public key (id_rsa.pub) to the remote server’s ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

vi /etc/ssh/sshd_config
change port to number 3253 or number spec
PermitRootLogin no
PasswordAuthentication no
systemctl reload ssh 

#firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow 3253
ufw show added
ufw status numbered
# ufw delete `rule_number`
ufw allow 80
ufw allow 443
ufw enable


#Protect SSH with Fail2Ban.( fail2ban will block any IP failed to ssh)
apt install fail2ban
systemctl enable fail2ban
systemctl start fail2ban
systemctl status fail2ban.service
# view
vi /etc/fail2ban/jail.d/defaults-debian.conf


#allow only office IP and S1 IP to ssh to seen.ae machine.
We edit /etc/hosts.allow and add this line
sshd: 82.137.245.143, 167.86.72.50
edit /etc/hosts.deny and add this line
sshd: ALL


curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
sudo apt-get install gitlab-runner
#https://docs.gitlab.com/runner/install/linux-repository.html
gitlab-runner --version
systemctl status gitlab-runner
gitlab-runner status
gitlab-runner register
curl -X POST -I "https://git.infostrategic.com/api/v4/runners/verify" # test ip runner whitelist
sudo journalctl -u gitlab-runner