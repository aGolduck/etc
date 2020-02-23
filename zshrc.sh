USR_BIN_PATH="/usr/local/bin:/usr/local/sbin"
USER_BIN_PATH="${HOME}/bin:${HOME}/.local/bin"
SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"
NODE_MAC_STABLE_PATH="/usr/local/opt/node@10/bin"
RUBY_MAC_STABLE_PATH="/usr/local/opt/ruby/bin"
PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
RUST_PATH="${HOME}/.cargo/bin"

export PATH="${RUST_PATH}:${USER_BIN_PATH}:${NODE_MAC_STABLE_PATH}:${RUBY_MAC_STABLE_PATH}:${PKG_PATH}:${USR_BIN_PATH}:${SYSTEM_BIN_PATH}:${PATH}"

# GEM PATH
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:${PATH}"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME/platform-tools

export MANPATH="/usr/local/man:${MANPATH}"
export MANPATH="/usr/pkg/man:${MANPATH}"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

source ${HOME}/github/zsh-users/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle ansible
antigen bundle colored-man-pages
antigen bundle extract
antigen bundle gnu_utils
antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-history-substring-search

antigen bundle denisidoro/navi
export NAVI_PATH="${HOME}/Sync/navi:/opt/navi/cheats"
# color scheme for navi
export FZF_DEFAULT_OPTS='--color=light'

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
#if exists percol; then
#    function percol_select_history() {
#        local tac
#        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
#        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
#        CURSOR=$#BUFFER         # move cursor
#        zle -R -c               # refresh
#    }
#

#    zle -N percol_select_history
#    bindkey '^R' percol_select_history
#fi
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

### language/platform version managers
# load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

alias 'e'='emacsclient -nw'
alias 'rm'='echo NO rm for you'
alias 'ghc'='stack ghc -- '
alias 'ghci'='stack ghci -- '
alias 'runghc'='stack runghc -- '

alias 'mgt'='mongo mongodb://myoffer:D41d8cd98f00B204e9800998ecf8427E@dds-wz9db587cdce66b433270.mongodb.rds.aliyuncs.com:3717/myoffer'
alias 'mgo'='mongo mongodb://myoffer:My0ffer2015@dds-wz942bd82f2bc1242309.mongodb.rds.aliyuncs.com:3717/myoffer'
alias 'mgu'='mongo mongodb://myoffer:D41d8cd98f00B204e9800998ecf8427E@dds-wz9db587cdce66b433270.mongodb.rds.aliyuncs.com:3717/myoffer-unittest'
