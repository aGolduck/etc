export ANDROID_HOME="${HOME}/Library/Android/sdk"

export SNAP_BIN_PATH="/snap/bin"
export USR_BIN_PATH="/usr/local/bin:/usr/local/sbin"
export USER_BIN_PATH="${HOME}/bin:${HOME}/.local/bin"
export SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"
export NODE_MAC_STABLE_PATH="/usr/local/opt/node@14/bin"
export RUBY_MAC_STABLE_PATH="/usr/local/opt/ruby/bin"
export PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
export RUST_PATH="${HOME}/.cargo/bin"
export GUIX_PATH="${HOME}/.guix-profile/bin:${HOME}/.config/guix/current/bin"
export CABAL_PATH="${HOME}/.cabal/bin"
export GHCUP_PATH="${HOME}/.ghcup/bin"

### tuning
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export HOMEBREW_NO_AUTO_UPDATE=1

# export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
# export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

# export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
# export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"

# npm 全局包安装需满足两个条件: 1. 不需要系统权限, 2. 无需因为 node 版本升级/变化重装
# 将包安装在 ~/.local 下实现无需系统权限，而且实现多用户隔离
# 但是将 `prefix=~/.local` 配置在 ~/.npmrc 会导致 nvm 完全无法使用
# 在 zshrc 中配置 NPM_CONFIG_PREFIX 并在 bashrc 中 unset NPM_CONFIG_PREFIX
# 再将 nvm 的 loading 脚本的过程加到 bashrc
# 日常使用 zsh, 需要切换 node 版本使用 bash
# 满足日常 node 包的使用的稳定要求，也满足 node 开发版本的切换需求
export NPM_CONFIG_PREFIX=~/.local

# guix
export GUIX_LOCPATH="${HOME}/.guix-profile/lib/locale"
export GUIX_PROFILE="/home/wenpin/.guix-profile"

# PATH
if [ -z ${_INHERITED_PATH+x} ]; then
    _INHERITED_PATH=${PATH}
fi

export PATH="${NODE_MAC_STABLE_PATH}:${RUBY_MAC_STABLE_PATH}:${GUIX_PATH}:${PKG_PATH}:${SNAP_BIN_PATH}:${USR_BIN_PATH}:${SYSTEM_BIN_PATH}:${_INHERITED_PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
export PATH="${USER_BIN_PATH}:${CABAL_PATH}:${GHCUP_PATH}:${RUST_PATH}:${PATH}"

### dynamic path for ruby
# export PATH="$(ruby -e 'puts Gem.user_dir')/bin:${PATH}"
# export PATH="${HOME}/.rbenv/bin:${PATH}"
# if command -v rbenv &> /dev/null
# then
#     eval "$(rbenv init - --no-rehash)"
# fi

# 整理 PATH，删除重复路径
if [ -n "$PATH" ]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}
        case $PATH: in
           *:"$x":*) ;;
           *) PATH=$PATH:$x;;
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi
export PATH

## MANPATH is removed, it is not neccessary.
## if extra manuals are needed, set MANPATH as below
## export MANPATH="$(manpath):/other/manual/paths"
