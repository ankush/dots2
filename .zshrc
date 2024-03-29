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


# Dotfile  manager
alias dot='/usr/local/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


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

# gpg singing config
export GPG_TTY=`tty`

# tmux aliases
alias mux=tmuxinator

ZSH_DISABLE_COMPFIX=true

# language specific configurations

# javascript
# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ruby
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# golang
export PATH="$HOME/go/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"


# rq issues
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# todo.txt
source /usr/local/Cellar/todo-txt/2.12.0/etc/bash_completion.d/todo_completion complete -F _todo t
alias t="todo.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias luamake=/Users/ankush/proj/lua-language-server/3rd/luamake/luamake


source ~/.localenvs

export PATH="$HOME/.poetry/bin:$PATH"
