export ZSH=$HOME/dev/share/oh-my-zsh
ZSH_THEME="sunrise"
ZSH_CUSTOM=$HOME/etc/zsh/oh-my-zsh
plugins=(
    autojump
    brew
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
    nvm
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
export PATH="$HOME/bin:$PATH"

[[ -z "$NVM_DIR" ]] && export NVM_DIR="$HOME/.nvm"
[[ -f "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"

export LANG=zh_CN.UTF-8
