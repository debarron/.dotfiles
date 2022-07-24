# Configure `zsh`

## How to setup `zsh`
1. Update and install
`sudo apt-get update && sudo apt-get install zsh -y`

2. Set up `zsh` as default
`chsh -s /usr/bin/zsh`


## How to install `ohmyzsh`
Run the following `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
Then, run `mv ~/.ohmyzsh ~/.config/ohmyzsh`


## How to configure this part
1. `cp .zshrc ~/`
2. `cp .config/ohmyzsh/custom ~/.config/ohmyzsh/`
3. `source $HOME/.zshrc`


