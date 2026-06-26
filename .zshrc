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
plugins=(git zsh-syntax-highlighting you-should-use zsh-bat)
plugins+=(poetry)
fpath+=$ZSH_CUSTOM/conda-zsh-completion
fpath+=~/.zfunc
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# iterm shell integration
ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=yes

zstyle ':completion:*' menu select

# escape timeout
KEYTIMEOUT=1
#ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL
ZVM_VI_SURROUND_BINDKEY=s-prefix
zvm_after_init_commands+=("bindkey '^[[A' up-line-or-search" "bindkey '^[[B' down-line-or-search")

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # Load nvm without auto-switching Node on startup
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#history
setopt nosharehistory

export PATH="$PATH:~/.local/bin/"

export ZSH_INIT_CACHE_DIR="$HOME/.cache/zsh-init"
mkdir -p "$ZSH_INIT_CACHE_DIR"

# Source Files
source ~/.zsh_fzf
source ~/.zsh_aliases
if [[ "${TERM_PROGRAM:-}" == "iTerm.app" ]]; then
    source ~/.iterm2_shell_integration.zsh
fi

if [ ! -f ~/.secrets ]; then
    echo "Secrets file not found. Creating a new one... `~/.secrets`"
    touch ~/.secrets
else
    source ~/.secrets
fi

if command -v atuin &> /dev/null; then
    ATUIN_INIT_CACHE="$ZSH_INIT_CACHE_DIR/atuin.zsh"
    if [[ ! -s "$ATUIN_INIT_CACHE" || "$(command -v atuin)" -nt "$ATUIN_INIT_CACHE" ]]; then
        atuin init zsh >| "$ATUIN_INIT_CACHE"
    fi
    source "$ATUIN_INIT_CACHE"
fi

# Initialize zoxide
if command -v zoxide &> /dev/null; then
    source ~/.zsh_zoxide
else
    echo "zoxide is not installed. Please install it to use this feature."
fi
# Added by Windsurf
export PATH="/Users/snekcode/.codeium/windsurf/bin:$PATH"

# Use project-specific Taskwarrior data directory
export TASKDATA=/Users/snekcode/Projects/ProjectViper/.taskmaster/tasks

# Task Master aliases added on 7/18/2025
alias tm='task-master'
alias taskmaster='task-master'

alias ccode="claude --model claude-3-7-sonnet-latest"

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
if [ -f "/Users/snekcode/.openclaw/completions/openclaw.zsh" ]; then
    source "/Users/snekcode/.openclaw/completions/openclaw.zsh"
fi

#compdef just

autoload -U is-at-least

_just() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    local common=(
'(--no-aliases)--alias-style=[Set list command alias display style]: :(left right separate)' \
'--ceiling=[Do not ascend above <CEILING> directory when searching for a justfile.]: :_files' \
'--chooser=[Override binary invoked by \`--choose\`]: :_default' \
'--color=[Print colorful output]: :(always auto never)' \
'--command-color=[Echo recipe lines in <COMMAND-COLOR>]: :(black blue cyan green purple red yellow)' \
'--cygpath=[Use binary at <CYGPATH> to convert between unix and Windows paths.]: :_files' \
'(-E --dotenv-path)--dotenv-filename=[Search for environment file named <DOTENV-FILENAME> instead of \`.env\`]: :_default' \
'-E+[Load <DOTENV-PATH> as environment file instead of searching for one]: :_files' \
'--dotenv-path=[Load <DOTENV-PATH> as environment file instead of searching for one]: :_files' \
'--dump-format=[Dump justfile as <FORMAT>]:FORMAT:(json just)' \
'-f+[Use <JUSTFILE> as justfile]: :_files' \
'--justfile=[Use <JUSTFILE> as justfile]: :_files' \
'--list-heading=[Print <TEXT> before list]:TEXT:_default' \
'--list-prefix=[Print <TEXT> before each list item]:TEXT:_default' \
'*--set=[Override <VARIABLE> with <VALUE>]: :(_just_variables)' \
'--shell=[Invoke <SHELL> to run recipes]: :_default' \
'*--shell-arg=[Invoke shell with <SHELL-ARG> as an argument]: :_default' \
'--tempdir=[Save temporary files to <TEMPDIR>.]: :_files' \
'--timestamp-format=[Timestamp format string]: :_default' \
'-d+[Use <WORKING-DIRECTORY> as working directory. --justfile must also be set]: :_files' \
'--working-directory=[Use <WORKING-DIRECTORY> as working directory. --justfile must also be set]: :_files' \
'*-c+[Run an arbitrary command with the working directory, \`.env\`, overrides, and exports set]: :_default' \
'*--command=[Run an arbitrary command with the working directory, \`.env\`, overrides, and exports set]: :_default' \
'--completions=[Print shell completion script for <SHELL>]:SHELL:(bash elvish fish nushell powershell zsh)' \
'()-l+[List available recipes in <MODULE> or root if omitted]' \
'()--list=[List available recipes in <MODULE> or root if omitted]' \
'--request=[Execute <REQUEST>. For internal testing purposes only. May be changed or removed at any time.]: :_default' \
'-s+[Show recipe at <PATH>]: :(_just_commands)' \
'--show=[Show recipe at <PATH>]: :(_just_commands)' \
'()--usage=[Print recipe usage information]:PATH:_default' \
'--check[Run \`--fmt\` in '\''check'\'' mode. Exits with 0 if justfile is formatted correctly. Exits with 1 and prints a diff if formatting is required.]' \
'--clear-shell-args[Clear shell arguments]' \
'(-q --quiet)-n[Print what just would do without doing it]' \
'(-q --quiet)--dry-run[Print what just would do without doing it]' \
'--explain[Print recipe doc comment before running it]' \
'(-f --justfile -d --working-directory)-g[Use global justfile]' \
'(-f --justfile -d --working-directory)--global-justfile[Use global justfile]' \
'--highlight[Highlight echoed recipe lines in bold]' \
'--list-submodules[List recipes in submodules]' \
'--no-aliases[Don'\''t show aliases in list]' \
'--no-deps[Don'\''t run recipe dependencies]' \
'--no-dotenv[Don'\''t load \`.env\` file]' \
'--no-highlight[Don'\''t highlight echoed recipe lines in bold]' \
'--one[Forbid multiple recipes from being invoked on the command line]' \
'(-n --dry-run)-q[Suppress all output]' \
'(-n --dry-run)--quiet[Suppress all output]' \
'--allow-missing[Ignore missing recipe and module errors]' \
'--shell-command[Invoke <COMMAND> with the shell used to run recipe lines and backticks]' \
'--timestamp[Print recipe command timestamps]' \
'-u[Return list and summary entries in source order]' \
'--unsorted[Return list and summary entries in source order]' \
'--unstable[Enable unstable features]' \
'*-v[Use verbose output]' \
'*--verbose[Use verbose output]' \
'--yes[Automatically confirm all recipes.]' \
'--changelog[Print changelog]' \
'--choose[Select one or more recipes to run using a binary chooser. If \`--chooser\` is not passed the chooser defaults to the value of \$JUST_CHOOSER, falling back to \`fzf\`]' \
'--dump[Print justfile]' \
'-e[Edit justfile with editor given by \$VISUAL or \$EDITOR, falling back to \`vim\`]' \
'--edit[Edit justfile with editor given by \$VISUAL or \$EDITOR, falling back to \`vim\`]' \
'--evaluate[Evaluate and print all variables. If a variable name is given as an argument, only print that variable'\''s value.]' \
'--fmt[Format and overwrite justfile]' \
'--groups[List recipe groups]' \
'--init[Initialize new justfile in project root]' \
'--man[Print man page]' \
'--summary[List names of available recipes]' \
'--variables[List names of variables]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
)

    _arguments "${_arguments_options[@]}" $common \
        '1: :_just_commands' \
        '*: :->args' \
        && ret=0

    case $state in
        args)
            curcontext="${curcontext%:*}-${words[2]}:"

            local lastarg=${words[${#words}]}
            local recipe

            local cmds; cmds=(
                ${(s: :)$(_call_program commands just --summary)}
            )

            # Find first recipe name
            for ((i = 2; i < $#words; i++ )) do
                if [[ ${cmds[(I)${words[i]}]} -gt 0 ]]; then
                    recipe=${words[i]}
                    break
                fi
            done

            if [[ $lastarg = */* ]]; then
                # Arguments contain slash would be recognised as a file
                _arguments -s -S $common '*:: :_files'
            elif [[ $lastarg = *=* ]]; then
                # Arguments contain equal would be recognised as a variable
                _message "value"
            elif [[ $recipe ]]; then
                # Show usage message
                _message "`just --show $recipe`"
                # Or complete with other commands
                #_arguments -s -S $common '*:: :_just_commands'
            else
                _arguments -s -S $common '*:: :_just_commands'
            fi
        ;;
    esac

    return ret

}

(( $+functions[_just_commands] )) ||
_just_commands() {
    [[ $PREFIX = -* ]] && return 1
    integer ret=1
    local variables; variables=(
        ${(s: :)$(_call_program commands just --variables)}
    )
    local commands; commands=(
        ${${${(M)"${(f)$(_call_program commands just --list)}":#    *}/ ##/}/ ##/:Args: }
    )

    if compset -P '*='; then
        case "${${words[-1]%=*}#*=}" in
            *) _message 'value' && ret=0 ;;
        esac
    else
        _describe -t variables 'variables' variables -qS "=" && ret=0
        _describe -t commands 'just commands' commands "$@"
    fi

}

if [ "$funcstack[1]" = "_just" ]; then
    (( $+functions[_just_variables] )) ||
_just_variables() {
    [[ $PREFIX = -* ]] && return 1
    integer ret=1
    local variables; variables=(
        ${(s: :)$(_call_program commands just --variables)}
    )

    if compset -P '*='; then
        case "${${words[-1]%=*}#*=}" in
            *) _message 'value' && ret=0 ;;
        esac
    else
        _describe -t variables 'variables' variables && ret=0
    fi

    return ret
}

_just "$@"
else
    compdef _just just
fi

# Task Master aliases added on 2/25/2026
alias hamster='task-master'
alias ham='task-master'

# Byte tools
export PATH="$HOME/.claude/tools:$PATH"
source ~/.claude/shell-hooks.zsh


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/snekcode/.lmstudio/bin"
# End of LM Studio CLI section


# opencode
export PATH=/Users/snekcode/.opencode/bin:$PATH

# Codex CLI
export PATH="/Applications/Codex.app/Contents/Resources:$PATH"
