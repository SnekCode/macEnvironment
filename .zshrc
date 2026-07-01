# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# export
# Java 17
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home/"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# java 23
# export JAVA_HOME="/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home/"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
export PATH="/usr/local/Cellar:$PATH"
export PATH="/usr/local/bin:$PATH"

# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

export GPG_TTY=$(tty)

# Path to vim config
MYVIMRC="~/.config/nvim/init.lua"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# update automatically without asking
zstyle ':omz:update' mode auto      

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting you-should-use zsh-bat)
plugins+=(poetry)
fpath+=$ZSH_CUSTOM/conda-zsh-completion
fpath+=~/.zfunc
source $ZSH/oh-my-zsh.sh

# iterm shell integration
ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=yes

zstyle ':completion:*' menu select

# escape timeout
KEYTIMEOUT=1
#ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
ZVM_VI_SURROUND_BINDKEY=s-prefix
zvm_after_init_commands+=("bindkey '^[[A' up-line-or-search" "bindkey '^[[B' down-line-or-search")

#. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # Load nvm without auto-switching Node on startup
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#history
setopt nosharehistory


export ZSH_INIT_CACHE_DIR="$HOME/.cache/zsh-init"
mkdir -p "$ZSH_INIT_CACHE_DIR"

# Source Files
source ~/.zsh_sources


# Use project-specific Taskwarrior data directory
export TASKDATA=$HOME/Projects/ProjectViper/.taskmaster/tasks

# Task Master aliases added on 7/18/2025
alias tm='task-master'
alias taskmaster='task-master'

alias ccode="claude --model claude-3-7-sonnet-latest"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv &> /dev/null; then
    RBENV_INIT_CACHE="$ZSH_INIT_CACHE_DIR/rbenv.zsh"
    if [[ ! -s "$RBENV_INIT_CACHE" || "$(command -v rbenv)" -nt "$RBENV_INIT_CACHE" ]]; then
        rbenv init - >| "$RBENV_INIT_CACHE"
    fi
    source "$RBENV_INIT_CACHE"
fi

# Godot
export PATH="/Applications/Godot.app/Contents/MacOS:$PATH"
export PATH=$PATH:$HOME/.maestro/bin

# OpenClaw Completion
if [ -f "$HOME/.openclaw/completions/openclaw.zsh" ]; then
    source "$HOME/.openclaw/completions/openclaw.zsh"
fi


# .local at start of path
export PATH="$HOME/.local/bin:$PATH"
