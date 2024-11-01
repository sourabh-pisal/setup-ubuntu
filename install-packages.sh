# Exit immediately
set -e 

# Install required packages from package-list.txt
sudo pacman -S --noconfirm $(cat package-list.txt)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
