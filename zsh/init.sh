# 交互式模式的初始化脚本
# 防止被加载两次
if [ -z "$_INIT_SH_LOADED" ]; then
    _INIT_SH_LOADED=1
else
    return
fi

# 如果是非交互式则退出，比如 bash test.sh 这种调用 bash 运行脚本时就不是交互式
# 只有直接敲 bash 进入的等待用户输入命令的那种模式才成为交互式，才往下初始化
case "$-" in
    *i*) ;;
    *) return
esac

### man path
export MANPATH="/usr/local/man:${MANPATH}"
export MANPATH="/usr/pkg/man:${MANPATH}"

### sourc modules
source $(dirname "$0")/path.sh
source $(dirname "$0")/functions.sh
# for login shell only
if [[ -o login ]]; then
    source $(dirname "$0")/plugins.sh
    source $(dirname "$0")/aliases.sh
fi

### tuning
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export HOMEBREW_NO_AUTO_UPDATE=1

export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"

### proxy
# export http_proxy="socks5://127.0.0.1:1080"
# export https_proxy="socks5://127.0.0.1:1080"
# export ALL_PROXY=socks5://127.0.0.1:1080
alias socks5="http_proxy=socks5://127.0.0.1:1080 https_proxy=socks5://127.0.0.1:1080 all_proxy=socks5://127.0.0.1:1080 "
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

### prompts
export PS1="%n%?%M%~%# "
vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
