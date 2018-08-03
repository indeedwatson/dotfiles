# disable antigen cache
ANTIGEN_CACHE=false
# source antigen plugin manager
if [ -f $HOME/.antigen/antigen.zsh ]; then
    . $HOME/.antigen/antigen.zsh
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install


# Colored man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# start ssh-agent automatically
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

# use ripgrep for fzf
# --files: List files that would be searched but to not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --glob: Addition conditions for search (in this case ignore everything in the
# .git/ folder)

export FZF_DEFAULT_COMMAND='rg --no-messages --files --smart-case --no-ignore \
    --hidden --follow -g "!{.git,soundfonts,undodir,z:,.dotnet45}" '

export FZF_DEFAULT_SORT='--sort 10000'

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null \
    || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_COMPLETION_TRIGGER='~~'

#######################################################
# ANTIGEN PLUGINS
#######################################################

# load the oh-my-zsh library
antigen use oh-my-zsh

# options for geometry theme
GEOMETRY_SYMBOL_PROMPT=">"
GEOMETRY_SYMBOL_EXIT_VALUE="✗"
GEOMETRY_COLOR_EXIT_VALUE="red"
GEOMETRY_COLOR_DIR="5"
PROMPT_GEOMETRY_EXEC_TIME="true"
# set geometry theme
antigen theme geometry-zsh/geometry


# antigen bundles bulk
antigen bundles <<EOBUNDLES
    # vi-mode for zsh
    # laurenkt/zsh-vimto # breaks history search when pressing up arrow

    # search backward in history for line matching what's been typed
    history-substring-search

    # enhance terminal with 256 colors
    chrissicool/zsh-256color
    
    # Interactive cd with fzf
    changyuheng/zsh-interactive-cd

    # track most used directories based on "frecency"
    z
    
    # enhances z with fzf
    andrewferrier/fzf-z
    
    # Bundles from the default repo
    git
    zsh-users/zsh-autosuggestions
    zdharma/fast-syntax-highlighting
EOBUNDLES

# Tell antigen that you're done
antigen apply

# aliases
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

set -o vi
source ~/.fzf.zsh


# wal
# Import colorscheme from 'wal' asynchronously
# &     # Run the process in the background
# (  )  # Hide shell job control messages
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
