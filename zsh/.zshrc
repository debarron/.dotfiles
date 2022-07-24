# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/ohmyzsh"
export ZSH_CUSTOM="$ZSH/custom"
export ZSH_CACHE_DIR="$ZSH/cache"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# History configuration
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Auto complete option
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/export-and-alias.zsh
source $ZSH_CUSTOM/anaconda-shell.zsh
source $ZSH_CUSTOM/prompt.zsh

#setopt PROMPT
#local prompt_ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# GIT info
plugins=(git zsh-syntax-highlighting)
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

local prompt_git_info="${vcs_info_msg_0_}"
#local prompt_git_info="$prompt_branch_git_info"

if [[ "$prompt_git_info" == "master" ]]
then 
  local prompt_git_info="⚡️"
else
  local prompt_git_info="${vcs_info_msg_0_}"
fi


local prompt_ret_status="%(?:🐳:🙈)"
local prompt_date_time_format="%{$fg_bold[white]%}%D{%m/%d|%R}%{$reset_color%}"
local prompt_dir_info="%{$fg_bold[cyan]%}%c%{$reset_color%}"
local prompt_new_line=$'\n'
local bold="%{$fg_bold[white]%}"

PROMPT='${prompt_new_line}\
${prompt_ret_status} \
${prompt_date_time_format} \
${prompt_dir_info} \
${prompt_git_info} \
${prompt_new_line}> '

