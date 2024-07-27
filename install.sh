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
	git\
	unzip\
	tmux\
	neovim\
	ripgrep\
	htop\
	tree\
	gnome-tweaks\
	gnome-shell-extension-manager\
	zsh\
 	alacritty

# Set zsh as default shell
chsh -s $(which zsh)

# Install omzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install brew applications 
brew install gcc fzf lazygit

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

# Setup dotfiles
/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME switch -f mainline
/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no

# Update gnome keybings
cat ~/.config/keybindings/media-keys | dconf load /org/gnome/settings-daemon/plugins/media-keys/
cat ~/.config/keybindings/wm-keybindings | dconf load /org/gnome/desktop/wm/keybindings/
cat ~/.config/keybindings/shell-keybindings | dconf load /org/gnome/shell/keybindings/
cat ~/.config/keybindings/mutter-keybindings | dconf load /org/gnome/mutter/keybindings/
cat ~/.config/keybindings/wayland-keybindings | dconf load /org/gnome/mutter/wayland/keybindings/

# Upgrade
sudo apt upgrade -y
