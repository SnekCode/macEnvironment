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
plugins=(git nvm zsh-syntax-highlighting you-should-use zsh-bat)
plugins+=(poetry)
source $ZSH/oh-my-zsh.sh
fpath+=$ZSH_CUSTOM/conda-zsh-completion
autoload -U compinit && compinit

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# iterm shell integration
ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=yes

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# escape timeout
KEYTIMEOUT=1
#ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
ZVM_VI_SURROUND_BINDKEY=s-prefix
zvm_after_init_commands+=("bindkey '^[[A' up-line-or-search" "bindkey '^[[B' down-line-or-search")


. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#history
setopt nosharehistory

export PATH="$PATH:~/.local/bin/"

# Source Files
source ~/.zsh_fzf
source ~/.zsh_aliases
source ~/.iterm2_shell_integration.zsh

if [ ! -f ~/.secrets ]; then
    echo "Secrets file not found. Creating a new one... `~/.secrets`"
    touch ~/.secrets
else
    source ~/.secrets
fi

source ~/.nvm/nvm.sh

if command -v atuin &> /dev/null; then
    eval "$(atuin init zsh)"
fi

# Initialize zoxide
if command -v zoxide &> /dev/null; then
    source ~/.zsh_zoxide
else
    echo "zoxide is not installed. Please install it to use this feature."
fi