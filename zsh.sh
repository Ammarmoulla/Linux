#zsh show cluster and namespace
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
plugins=(
  git
  kubectl
  kube-ps1
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
)
PROMPT='$(kube_ps1)'$PROMPT



###PAM: Authentication failure###
edit in /etc/pam.d/chsh
auth       required   pam_shells.so
auth       sufficient   pam_shells.so



#zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
#zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
#fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
#zsh-autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete



chsh -s /bin/bash
/home/aiuser/miniconda3/bin/conda init zsh
chsh -s /bin/zsh
source ~/.zsh