
# Directories
export PATH="/usr/local/Cellar/coreutils/8.32/libexec/gnubin:$HOME/bin:$PATH"
export MANPATH="/usr/local/Cellar/coreutils/8.32/libexec/gnuman:$MANPATH"
export ONEDRIVE_HOME="$HOME/OneDrive/"
export UMKC="$ONEDRIVE_HOME/Documents/UMKC/"
export UMKC_RESEARCH="$UMKC/RESEARCH"
export RESEARCH="$ONEDRIVE_HOME/Documents/RESEARCH/"
export NODES="$RESEARCH/nodes/"
export OGR="$HOME/OGR/"
export CODE="$HOME/Code/"
export PYTHONSTARTUP="$HOME/.pythonrc"

export CLOUDLAB_USER="dl544"
export CLOUDLAB_PRIVATE_KEY="$HOME/.ssh/id_cloudlab"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grep="grep --color=always "
alias vim="nvim"
alias todo="cat $ONEDRIVE_HOME/journal.md"
alias todoe="nvim $ONEDRIVE_HOME/journal.md"

alias gacp='git add --all && git commit -m "Automatic commit" && git push origin master'
alias gia='git add --all'
alias gic='git commit -m'
alias gip='git push origin master'
alias gil='git pull origin master'
alias gitp='git push'
alias gitl='git pull'

alias clusterc='f() { cd '$CODE/ClusterConfig' && ./cluster-configure-morespace.sh $1 dl544 ~/.ssh/id_cloudlab};f'
alias ramcloudc='f() { cd '$CODE/RAMCloudConfigure' && ./ramcloud-configure.sh $1 dl544 ~/.ssh/id_cloudlab};f'
alias fusec='f() { cd '$CODE/FUSEConfigure' && ./fuse-configure.sh $1 dl544 ~/.ssh/id_cloudlab};f'
alias crf='F() { clusterc $1 && ramcloudc $1 && fusec $1};F'


export EDITOR="nvim"
