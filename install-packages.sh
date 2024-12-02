# Exit immediately
set -e 

# Install required packages from package-list.txt
brew install $(cat package-list.txt)
