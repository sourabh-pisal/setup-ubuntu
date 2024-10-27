# Exit immediately
set -e 

# Update package manager
sudo pacman -Syu --noconfirm

# cleanup
rm -rf $HOME/Workplace/dotfiles

# Install required packages
sudo pacman -S --noconfirm \
  amd-ucode \
  arch-audit \
  base \
  bash-language-server \
  firefox \
  fzf \
  gcc \
  git \
  htop \
  iwd \
  kitty \
  lazygit \
  libnotify \
  linux \
  linux-firmware \
  lvm2 \
  man-db \
  man-pages \
  neovim \
  openssh \
  pipewire \
  pipewire-alsa \
  pipewire-audio \
  pipewire-pulse \
  polkit \
  prettier \
  qt5-wayland \
  speech-dispatcher \
  sudo \
  sway \
  swaybg \
  swayidle \
  swaylock \
  swaync \
  texinfo \
  thunderbird \
  tmux \
  ttf-meslo-nerd \
  ufw \
  vim \
  vlc \
  vscode-json-languageserver \
  which \
  wlsunset \
  wofi \
  xdg-utils \
  zsh

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
