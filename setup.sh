# insure brew is installed

# Function to install Homebrew
install_homebrew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully."
}

# Function to install via Homebrew
brew_install() {
    # The package name is passed as an argument to the function
    package_name=$1
    
    # Check if the package is already installed
    if brew list --formula | grep -q "^${package_name}$"; then
        echo "Package '$package_name' is already installed."
    else
        # If the package is not installed, install it using brew
        echo "Installing package '$package_name'..."
        brew install "$package_name"
        echo "Package '$package_name' installed successfully."
    fi
}

# Check if Homebrew is installed
if command -v brew &> /dev/null
then
    echo "Homebrew is already installed."
else
    echo "Homebrew is not installed."
    install_homebrew
fi


brew install --cask iterm2
brew install neovim
brew install --cask visual-studio-code
brew install tmux
brew install --cask obsidian
brew install --cask drawio
brew install node

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# set up tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/

# set up neovim config
git clone https://github.com/SnekCode/nvim-config.git ~/.config/nvim/

