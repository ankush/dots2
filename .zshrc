# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/ankush/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:$PATH

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# increase history
SAVEHIST=1048576
# the one true text editor
alias v="nvim"
alias nv="poetry run nvim"
alias la="ls -lah"
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="nvim +Man!"

# Common config files
alias vrc="nvim ~/.config/nvim/init.vim"

function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# safe rm and move
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# exa
alias ls=exa
alias tree="exa -T"


# Dotfile  manager
alias dot='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

alias :q="exit" # hehe

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

# send ripgrep output to vim quickfix list
function vrg()
{
    nvim -q <(rg --vimgrep "$@")
}

function vsemgrep()
{
    nvim -q <(semgrep "$@" --vim)
}

function vflake8()
{
    nvim -q <(flake8 "$@")
}

# gpg singing config
export GPG_TTY=`tty`

# tmux aliases
alias mux=tmuxinator

# bench aliases

alias browse="bench --site $CUR_SITE browse --user Administrator"


ZSH_DISABLE_COMPFIX=true

# language specific configurations

# javascript
# Node
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

# ruby
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# python
alias python="python3"
alias pip="pip3"

# rq issues
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.localenvs


# if virtual env exist then source it (set my TMUX startup script)
if [ -n "$VIRTUAL_ENV" ]; then
    source "$VIRTUAL_ENV/bin/activate";
fi
