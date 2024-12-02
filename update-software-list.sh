# Exit immediately
set -e 

# Remove old package list
rm package-list.txt

# Update package list
brew leaves > package-list.txt
