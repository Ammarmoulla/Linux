sudo lsof -i -P -n | grep LISTEN
kill -9 $(lsof -t -i:8008)
nslookup -type=A infoai.infostrategic.com


#for with commnad
for f in *.mp3; do mv "$f" ../; done

#ls
ls --hide="*.mp3"

#zip
zip -r label.zip . -x "**datasets/*" "**__pycache__/*";

#sed
sed -i '/000432cddc00c993037a1cdc9e3938dd.mp3/d' audiofolder/metadata.csv
sed -i '/2d417eba33f41231187eba24f09e1427/d' audiofolder/clips/metadata.csv && rm -f audiofolder/clips/2d417eba33f41231187eba24f09e1427.mp3
sed -i 's|^\(\s*image:\s*\).*|\1hub.infostrategic.com/lcp/manage_pmo_next:v0.1|' deployment.yaml

%s/sttai/infoai/g


#cuda
CUDA_VISIBLE_DEVICES=0 python mapping_datasets.py
tensorboard --logdir output/runs --port 9093
autossh -L 9093:127.0.0.1:9093 ai.server.office

jupyter-notebook --port 9090
autossh -L 9090:127.0.0.1:9090 ai.server.office

#cp faster
rsync -av --progress ../serivce_stt/ . --exclude=venv --exclude=.git 
rsync -avr -e "ssh -l aiuser"  --exclude=venv/ --exclude=.git . ai.server.office:/home/aiuser/tts_service/
rsync -avr -e "ssh -l aiuser" --exclude="bkup/"  --exclude=venv/ --exclude=.git --exclude='*.zip' --exclude='*.pth' --exclude="*.pt" --info=progress2 ai.server.office:/home/aiuser/test_ocr .
scp finetuning_v2.py ai.server.office:/home/aiuser/stt/
scp infoai:/home/infoai/fatwa-translation/models/eng_multi_model/ .

#git-lfs
sudo apt install git-lfs
git lfs install --skip-smudge
git lfs install --local --skip-smudge
git lfs migrate import --include="*.zip, *.bin, *.mp3, *.wav, *.pt" --everything
git lfs ls-files # list LFS files
git push --all --force
#
zip -qr test.zip test
unzip test.zip


jobs -p
jobs -l
kill -9 `jobs -p`


#nvidia-smi
sudo rmmod nvidia


#install huggingsound with GPU
pip install accelerate -U
pip install tensorboardX
pip install torchvision torchaudio

 #cache huggingface
 ~/.cache/huggingface

#size folder
du -h --max-depth=1 .
sudo du -h --max-depth=1 /var/lib/docker/overlay2/

python evaluate.py > results/train_lr_0.00005_hussian_common_73918_max_step_1000_batch_size_2.txt




#dns
apt update && apt install dnsutils -y

#vim
apt update && apt install vim -y



#in Ubuntu 22.04
sudo apt install nvidia-cudnn

#config
gunicorn server:app --print-config


#curl
curl -X PUT -u ammar.moulla:oBD8R-HsnkG-ii6z3-NdSAW-TE83e "https://fs.infostrategic.com/remote.php/webdav/STTS/all_model/test.zip" -T test.zip;
curl -X GET -u ammar.moulla:oBD8R-HsnkG-ii6z3-NdSAW-TE83e "https://fs.infostrategic.com/remote.php/webdav/STTS/Dataset/Emirates_data/after_split" --output after_split;



#TensorRT
pip show tensorrt
pip show nvidia-tensorrt
pip list | grep -i tensorrt



#tts
python convert_original_discriminator_checkpoint.py --language_code ara --pytorch_dump_folder_path "finetune_arabic"
CUDA_VISIBLE_DEVICES=0 python run_vits_finetuning.py ./training_config_examples/finetune_arabic.json



#ngrok

ngrok config check
vi ~/.config/ngrok/ngrok.yml


#sed
sed -i.bak 1i"id1,id2,id3,id4" file.csv
sed -i.bak 1i"file_name,transcription" metadata.csv
sed -i "/file_name.wav/d"
sed -i "s/,/.wav,/" 
sed -i "s/,/\|/" "./train.txt"
sed -i 1d train.txt
11,15s/^/#/g

#zombie
ps axo stat,ppid,pid,comm | grep -w defunct;
kill -s SIGCHLD PID
kill -9 362911


#history command
cat  /var/log/auth.log | grep kill


#nginx
cp lcp02.infostrategic.com stuner.infostrategic.com
ln -s /etc/nginx/sites-available/stuner.infostrategic.com /etc/nginx/sites-enabled/
/usr/sbin/nginx -t && /usr/sbin/nginx -s reload


#when dont find requirements.txt
python -m pip install .



#tmux 
tmux ls # show session
tmux new -s tts_service # create new session
ctrl + b then d # logout session
tmux attach -t tts_service # login session
ctrl + b then [    # up and down in session then q to exit

#tmux restore
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#===========================
Open ~/.tmux.conf file and add 
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-processes 'ssh psql mysql sqlite3 bash python python3 jupyter-notebook'

set -g @continuum-restore 'on'
set -g @continuum-save-interval '15'

run '~/.tmux/plugins/tpm/tpm'
#===========================
press prefix + I (capital i, as in Install) # to download and install the plugin.
press Prefix + Ctrl-r #restore a closed tmux environment at any time by pressing the Prefix + Ctrl-r
press Prefix + Ctrl-s. The saved Tmux session will open.



#opnessl
openssl req -x509 -newkey rsa:2048 -sha256 -days 3650 -nodes \
 -keyout ssl/ngrok.key -out ssl/ngrok.crt \
 -subj '/CN=*.ngrok-free.app' \
 -addext 'subjectAltName=DNS:*.ngrok-free.app'


#jupyter
jupyter nbconvert --to script train_coarse.ipynb


#websocket test
sudo wget -qO /usr/local/bin/websocat https://github.com/vi/websocat/releases/latest/download/websocat.x86_64-unknown-linux-musl
sudo chmod a+x /usr/local/bin/websocat
websocat --version
websocat -s 8080
websocat ws://ws.vi-server.org/mirror
rlwrap websocat wss://oriole-genuine-entirely.ngrok-free.app/socket.io/


#pwd
pwdx pid #show full path process


#tmux widow
prefix c  # New window
prefix 1  # Go to window 1
prefix  n   # Go to next window
prefix  ,   # rename window
#note : prefix is Ctrl + b


#history in zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY



#autotime python
pip install ipython_autotime



#brodcast massege
wall -n "System will go down for 2 hours" 


#clean output
jupyter nbconvert --clear-output whiper.ipynb


#delete folder with exculde
find ../checkpoints -type f ! -name "vocoder_v2.pt" -delete





#openssl
openssl x509 -in certnew\(Root\).cer -inform DER -out rootCA.pem -outform PEM
openssl pkcs7 -in certnew\(certificate\ chain\).p7b -inform DER -print_certs -out chain.pem
openssl x509 -in certnew_Certificate.cer -inform DER -out certificate.pem -outform PEM
openssl x509 -in certificate.pem -text -noout | grep -A2 Validity
openssl verify -CAfile chain.pem certificate.pem
openssl s_client -connect your-domain.com:443 -servername your-domain.com
curl -k https://aiuat.pp.gov.ae
curl --cacert root.pem https://aiuat.pp.gov.ae


#cpu
lscpu
cat /proc/cpuinfo | grep -i avx
lsb_release -a

#gpu-htop
nvtop
watch -c gpustat -cp --color


#delete .env values
sed "s/=.*/=/g"  .env.example


#check connect to mail
telnet mail.pmo.gov.ae 587
telnet smtp.gmail.com 587


sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd



#tips for jitsi
ip route del 172.18.0.0/16 dev docker                                    
ip route del 172.18.0.0/16 dev docker0                                   
ip route del 172.19.0.0/16 dev br-0fd2d00ac9ab                                                                                          
ip route del docker0                                                     
ip route del 172.18.0.0/16                                                                                                           
sudo ip route add 172.17.0.0/16 dev docker0
{                                                                               
                                                                                
  "bip": "172.17.0.1/16"                                                        
                                                                                
}

#Recorder Video Jitsi
echo "options snd-aloop enable=1,1,1,1,1,1,1,1,1,1,1,1 index=0,1,2,3,4,5,6,7,8,9,10,11" > /etc/modprobe.d/alsa-loopback.conf 
echo "snd-aloop" >> /etc/modules 
modprobe snd-aloop 
lsmod | grep snd_aloop 
vi /etc/default/grub 
reboot 
docker compose -f jibri.yml up --scale jibri=7 -d     
docker exec videorecording-jibri-1 sed -i 's/Loopback/0/g' /home/jibri/.asoundrc && docker exec videorecording-jibri-2 sed -i 's/Loopback/1/g' /home/jibri/.asoundrc && docker exec videorecording-jibri-3 sed -i 's/Loopback/2/g' /home/jibri/.asoundrc && docker exec videorecording-jibri-4 sed -i 's/Loopback/3/g' /home/jibri/.asoundrc && docker exec videorecording-jibri-5 sed -i 's/Loopback/4/g' /home/jibri/.asoundrc && docker exec videorecording-jibri-6 sed -i 's/Loopback/5/g' /home/jibri/.asoundrc && docker exec videorecording-jibri-7 sed -i 's/Loopback/6/g' /home/jibri/.asoundrc
docker compose -f jibri.yml restart
ls -alh /proc/asound 


/usr/bin/certbot --nginx certonly --dry-run --agree-tos -d  call.ripplez.ae && /usr/bin/certbot certonly --nginx --keep --agree-tos -m ammar.moulla@example.com -d  call.ripplez.ae
ln -s /etc/nginx/sites-available/call.ripplez.ae /etc/nginx/sites-enabled/call.ripplez.ae
/usr/sbin/nginx -t && /usr/sbin/nginx -s reload