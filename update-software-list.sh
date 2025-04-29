# Exit immediately
set -e 

# Remove old package list
rm brew-package-list.txt
rm brew-cask-package-list.txt

# Update package list
brew leaves > brew-package-list.txt
brew list --cask > brew-cask-package-list.txt
