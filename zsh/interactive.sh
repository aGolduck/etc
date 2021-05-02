# 交互式模式的初始化脚本
# 防止被加载两次
# 不需要 export, export 会影响子 shell
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

### source modules
source $(dirname "$0")/env.sh
source $(dirname "$0")/functions.sh
source $(dirname "$0")/aliases.sh
source $(dirname "$0")/plugins.sh


### history, 必须在 oh-my-zsh 配置
export HISTSIZE=1000000000
export SAVEHIST=1000000000


### proxy
# export http_proxy="socks5://127.0.0.1:1080"
# export https_proxy="socks5://127.0.0.1:1080"
# export ALL_PROXY=socks5://127.0.0.1:1080
alias socks5="http_proxy=socks5://127.0.0.1:1080 https_proxy=socks5://127.0.0.1:1080 all_proxy=socks5://127.0.0.1:1080 "
alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
alias unsetproxy="unset ALL_PROXY"

### prompts
## bash style prompt
export PS1="%n%?%M%~%# "
## zsh style prompt
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%n%?%M%~${vcs_info_msg_0_} %# '

### for emacs-libvterm
autoload -U add-zsh-hook
add-zsh-hook -Uz chpwd (){ print -Pn "\e]2;%m:%2~\a" }

### login shell, can be replaced by .zprofile and .zlogin
if [[ -o login ]]; then
    ## 该检测对 macos 不起作用
    echo "logining ${HOST}..."
fi
