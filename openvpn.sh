apt install openvpn git
git clone https://github.com/Nyr/openvpn-install
cd openvpn-install
bash openvpn-install.sh
cd /etc/openvpn/server/
nano server.conf
systemctl | grep openvpn
ps aux | grep vpn
cat /etc/openvpn/server/server.conf