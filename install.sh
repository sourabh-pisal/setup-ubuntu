# Exit immediately
set -e 
# Base installers
#sudo apt update
#sudo apt install -y \
#       curl\
#       git\
#       unzip\
#       tmux\
#       neovim\
#       fzf\
#       ripgrep\
#       htop\
#       tree\
#       gnome-tweaks\
#       gnome-shell-extension-manager

# Run installers
for script in ./config/*.sh; do source $script; done

# Upgrade
#sudo apt upgrade -y
