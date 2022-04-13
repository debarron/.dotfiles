# Before we start
sudo apt update
sudo apt upgrade
sudo apt install ubuntu-restricted-extras

# Install snap in ubuntu-like
sudo apt install snapd

# Install software with snap
sudo snap install snap-store
sudo snap install nvim --classic
sudo snap install pycharm-community --classic
sudo snap install slack
sudo snap install spotify

# Configure zsh shell
## Install
sudo apt install zsh
chsh -s /bin/zsh
- then log-out of the system

## Install ohmyz
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create a ssh-key and put it to github
eval "$(ssh-agent)"
ssh-keygen -t rsa -b 4096 "MAIL"
-- register `id_rsa_github`
ssh-add -k `path_to_ssh_key`
ssh -T git@github.com

# Create ~/Code and download dotfiles
mkdir ~/Code
git clone git@github.com:debarron/dot-files.git
-- move inside the repo and put all configs in `~/.config`

# Install github-desktop
-- From flatpak, look at the most recently updated one
