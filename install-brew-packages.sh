# Exit immediately
set -e 

# Install required packages from package-list.txt
brew install $(cat brew-package-list.txt)
brew install --cask $(cat brew-cask-package-list.txt)
