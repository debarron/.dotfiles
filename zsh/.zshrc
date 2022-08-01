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

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '- ('$branch')'
  fi
}


local prompt_ret_status="%(?:🐳:🙈)"
local prompt_date_time_format="%{$fg_bold[white]%}%D{%m/%d|%R}%{$reset_color%}"
local prompt_dir_info="%{$fg_bold[cyan]%}%c%{$reset_color%}"
local prompt_new_line=$'\n'
local bold="%{$fg_bold[white]%}"

PROMPT='${prompt_new_line}\
${prompt_ret_status} \
${prompt_date_time_format} \
${prompt_dir_info} \
$(git_branch_name) \
${prompt_new_line}> '

