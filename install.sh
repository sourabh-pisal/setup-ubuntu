# Exit immediately
set -e 

# Update package manager
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y 

# Install git
sudo apt install build-essential procps curl file git -y

# Create Workplace dir
mkdir -p $HOME/Workplace

# Change dir to Workplace
cd $HOME/Workplace

# Clone setup-arch repository
git clone https://github.com/sourabh-pisal/setup-ubuntu.git

# Change dir to setup-arch
cd $HOME/Workplace/setup-ubuntu

# Run setup script
./setup.sh
