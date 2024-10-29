# Exit immediately
set -e 

# Update package manager
sudo pacman -Syu --noconfirm

# Install git
sudo pacman -S --noconfirm git

# Create Workplace dir
mkdir -p $HOME/Workplace

# Change dir to Workplace
cd $HOME/Workplace

# Clone setup-arch repository
git clone https://github.com/sourabh-pisal/setup-arch.git

# Change dir to setup-arch
cd $HOME/Workplace/setup-arch

# Run setup script
./setup.sh
