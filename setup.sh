# Exit immediately
set -e 

# cleanup old dotfiles
rm -rf $HOME/Workplace/dotfiles

# Install omzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add homebrew to PATH of current shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install required packages from homebrew
brew install $(cat package-list.txt)

# Change dir to Workplace
cd $HOME/Workplace

# Create alias for dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME"

# Clone dotfiles bare repository
git clone --bare https://github.com/sourabh-pisal/dotfiles.git $HOME/Workplace/dotfiles

# Change dir to dotfiles
cd $HOME/Workplace/dotfiles

# Setup dotfiles
/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME switch -f mainline
/usr/bin/git --git-dir=$HOME/Workplace/dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no

# Turn off gnome dash to dock
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]";done

# Add keybinding to switch workspaces with super + number
for i in {1..9}; do gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']";done

# Set zsh as default shell
chsh -s $(which zsh)
