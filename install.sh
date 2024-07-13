# Exit immediately
set -e 

# cleanup
rm -rf $HOME/Workplace/dotfiles
rm -rf $HOME/.oh-my-zsh/
rm -rf $HOME/.tmux/plugins/tpm

# Base installers
sudo apt update
sudo apt install -y \
	gcc\
	curl\
	git\
	unzip\
	tmux\
	neovim\
	fzf\
	ripgrep\
	htop\
	tree\
	gnome-tweaks\
	gnome-shell-extension-manager\
	zsh

# Set zsh as default shell
chsh -s $(which zsh)

# Install omzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# Create Workplace dir
mkdir -p $HOME/Workplace

# Change dir to Workplace
cd $HOME/Workplace

# Create alias for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME"

# Clone dotfiles bare repository
git clone --bare git@github.com:sourabh-pisal/dotfiles.git $HOME/Workplace/dotfiles

# Change dir to dotfiles
cd $HOME/Workplace/dotfiles

/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME switch -f mainline
/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no


# Upgrade
sudo apt upgrade -y
