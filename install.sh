# Exit immediately
set -e 

# Update package manager
sudo pacman -Syu --noconfirm

# cleanup
rm -rf $HOME/Workplace/dotfiles

# Install required packages from package-list.txt
sudo pacman -S --noconfirm $(cat package-list.txt)

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

# Set zsh as default shell
chsh -s $(which zsh)
