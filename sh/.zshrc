# disable antigen cache
ANTIGEN_CACHE=false
# source antigen plugin manager
if [ -f $HOME/.antigen/antigen.zsh ]; then
    . $HOME/.antigen/antigen.zsh
fi

# Import colorscheme from 'wal'
# (wal -r &)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# aliases
if [ -f $HOME/.aliases ]; then
    . $HOME/.aliases
fi

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

# start fasd
eval "$(fasd --init auto)"

# use ripgrep for fzf
# --files: List files that would be searched but to not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --glob: Addition conditions for search (in this case ignore everything in the
# .git/ folder)

export FZF_DEFAULT_COMMAND='rg --no-messages --files --no-ignore --hidden --follow --glob "!.git/*"'

#######################################################
# ANTIGEN PLUGINS
#######################################################

# load the oh-my-zsh library
antigen use oh-my-zsh

# set the prompt theme
antigen theme denysdovhan/spaceship-zsh-theme


# antigen bundles bulk
antigen bundles <<EOBUNDLES
    # vi-mode for zsh
    # vi-mode

    # search backward in history for line matching what's been typed
    history-substring-search

    # enhance terminal with 256 colors
    # chrissicool/zsh-256color
    
    # Interactive cd with fzf
    # changyuheng/zsh-interactive-cd

    # track most used directories based on "frecency"
    z
    
    # enhances z with fzf
    andrewferrier/fzf-z
    
    # Bundles from the default repo
    caiogondim/bullet-train.zsh
    git
    command-not-found
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Tell antigen that you're done
antigen apply
