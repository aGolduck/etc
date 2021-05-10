### functions

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

function cgh() {
    git clone https://github.com/${${${1}#'https://github.com/'}%'.git'}.git ~/g/${${${1}#'https://github.com/'}%'.git'}
}

function cgw() {
    local removedSSH=${${1}#'git@git.woa.com:'}
    local removedHTTPS=${${removedSSH}#'https://git.code.oa.com/'}
    local gitRepo=${${removedHTTPS}%'.git'}
    git clone git@git.woa.com:${gitRepo}.git ~/w/${gitRepo}
}

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

function prew() {
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" /home/linuxbrew/.linuxbrew/bin/brew "$@"
}

function prew_disable() {
	  export PATH=${PATH##*"/.linuxbrew/bin:"}
	  export PATH=${PATH##*"/.linuxbrew/sbin:"}
	  export MANPATH=${MANPATH##*"/.linuxbrew/share/man:"}
	  export INFOPATH=${INFOPATH##*"/.linuxbrew/share/info:"}
}

function prew_enable() {
	  LINUXBREW='/home/linuxbrew/.linuxbrew'
	  brew_disable
	  export PATH="$LINUXBREW/bin:$LINUXBREW/sbin:$PATH"
	  export MANPATH="$LINUXBREW/share/man:$MANPATH"
	  export INFOPATH="$LINUXBREW/share/info:$INFOPATH"
	  # export HOMEBREW_NO_AUTO_UPDATE=1
}

function pwdf() {
    local current_dir=`pwd`
    local copied_file=`find $current_dir -type f -print |percol`
    echo -n $copied_file |pclip;
}

function vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
