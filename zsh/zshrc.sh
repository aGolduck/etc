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
    ubuntu
    web-search
    yarn
)
source $ZSH/oh-my-zsh.sh
#source $HOME/.zshenv

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
function pclip() {
    if [ $OS_NAME = "CYGWIN" ]; then
	putclip "$@";
    elif [ $OS_NAME = "Darwin" ]; then
	pbcopy "$@";
    else
	if [ -x /usr/bin/xsel ]; then
	    xsel -ib "$@";
	else
	    if [ -x /usr/bin/xclip ]; then
		xclip -selection c "$@";
	    else
		echo "Neither xsel or xclip is installed!"
	    fi
	fi
    fi
}

function pwdf()
{
    local current_dir=`pwd`
    local copied_file=`find $current_dir -type f -print |percol`
    echo -n $copied_file |pclip;
}

export LC_CTYPE
LC_CTYPE="en_US.UTF-8"
export LC_COLLATE
LC_COLLATE="C"
export LC_TIME
LC_TIME="C"
export LC_NUMERIC
LC_NUMERIC="C"
export LC_MONETARY
LC_MONETARY="C"
export LC_MESSAGES
LC_MESSAGES="en_US.UTF-8"
export LC_ALL
LC_ALL=""

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
#export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

alias 'rm'='echo NO rm for you'
