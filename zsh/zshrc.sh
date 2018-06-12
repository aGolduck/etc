export ZSH=$HOME/usr/share/oh-my-zsh
ZSH_THEME="sunrise"
ZSH_CUSTOM=$HOME/etc/share/zsh/oh-my-zsh
plugins=(
    autojump
    # cask
    command-not-found
    common-aliases
    compleat
    colored-man-pages
    colorize
    cp
    docker
    extract
    git
    gnu_utils
    nix
    node
    npm
    osx
    pip
    python
    stack
    sudo
    systemd
    tmux
    web-search
    yarn
)
source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}
function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}
function exists { which $1 &> /dev/null }
if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

