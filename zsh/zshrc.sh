USR_BIN_PATH="/usr/local/bin:/usr/local/sbin"
USER_BIN_PATH="$HOME/bin:$HOME/.local/bin"
SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"
NODE_MAC_STABLE_PATH="/usr/local/opt/node@10/bin:${PATH}"
PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
export PATH="${USER_BIN_PATH}:${PKG_PATH}:${USR_BIN_PATH}:${SYSTEM_BIN_PATH}:${PATH}"
if [ "${USER}" != root -o ! -w /nix/var/nix/db ]; then
    export NIX_REMOTE=daemon
fi

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME/platform-tools

export MANPATH="/usr/local/man:${MANPATH}"
export MANPATH="/usr/pkg/man:${MANPATH}"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
source ${HOME}/usr/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle colored-man-pages
antigen bundle extract
antigen bundle gnu_utils
antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-history-substring-search
antigen apply

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

export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="C"
export LC_TIME="C"
export LC_NUMERIC="C"
export LC_MONETARY="C"
export LC_MESSAGES="en_US.UTF-8"
export LC_ALL=""

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#export TNVM_DIR="/home/wenpin/.tnvm"
#[ -s "$TNVM_DIR/tnvm.sh" ] && . "$TNVM_DIR/tnvm.sh"  # This loads nvm

alias 'rm'='echo NO rm for you'
alias 'ghc'='stack ghc -- '
alias 'ghci'='stack ghci -- '
alias 'runghc'='stack runghc -- '
