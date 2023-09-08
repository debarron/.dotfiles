#!/bin/bash

# $1 Where to reference the symlink

NVIM_VERSION=0.9.2
LINUX_URL="https://github.com/neovim/neovim/releases/download/v$NVIM_VERSION/nvim-linux64.tar.gz"

# Download and extract
wget -P ./nvim/ $LINUX_URL
tar -xvzf ./nvim/nvim-linux64.tar.gz -C ./nvim

# Set a reference
REPO_DIR_STR="$(pwd)"
sed "s|^REPO_DIR=.*$|REPO_DIR=$REPO_DIR_STR|g" scripts/run_nvim.sh.template > scripts/run_nvim.sh
ln -rs ./scripts/run_nvim.sh $1/nvim

# Remove the tarfiles
rm ./nvim/nvim-linux64.tar.gz

