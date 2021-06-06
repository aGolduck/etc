# 防止被加载两次
if [ -n "$_ENV_PATH" ]; then
    export PATH=${_ENV_PATH}
    return
fi

export ANDROID_HOME="${HOME}/Library/Android/sdk"

export CABAL_PATH="${HOME}/.cabal/bin"
export GHCUP_PATH="${HOME}/.ghcup/bin"
export GUIX_PATH="${HOME}/.guix-profile/bin:${HOME}/.config/guix/current/bin"
export MAC_NODE_STABLE_PATH="/usr/local/opt/node@14/bin"
export MAC_PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
export MAC_RUBY_STABLE_PATH="/usr/local/opt/ruby/bin"
export MAC_GNUBIN_PATH="/usr/local/opt/coreutils/libexec/gnubin"
export _NIX_PATH="${HOME}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${HOME}/.nix-profile/sbin:/nix/var/nix/profiles/default/sbin" # NIX_PATH is occupied, see /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
export RUST_PATH="${HOME}/.cargo/bin"
export SNAP_BIN_PATH="/snap/bin"
export SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"
export USER_BIN_PATH="${HOME}/bin:${HOME}/.local/bin"
export USR_BIN_PATH="/usr/local/bin:/usr/local/sbin"
export SDKMAN_PATH=

kernel="$(uname -s)"
case $kernel in
    Linux)
        export COURSIER_PATH="${HOME}/.local/share/coursier/bin"
    ;;
    Darwin)
        export COURSIER_PATH="${HOME}/Library/Application Support/Coursier/bin"
    ;;
esac

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

# nix
if [ -e /home/w/.nix-profile/etc/profile.d/nix.sh ]; then source /home/w/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
# guix
export GUIX_LOCPATH="${HOME}/.guix-profile/lib/locale"
export GUIX_PROFILE="${HOME}/.guix-profile"
[ -f "$GUIX_PROFILE/etc/profile" ] && source "$GUIX_PROFILE/etc/profile"

# PATH
# if [ -z ${_INHERITED_PATH+x} ]; then
    # _INHERITED_PATH=${PATH}
# fi

export PATH="${MAC_NODE_STABLE_PATH}:${MAC_RUBY_STABLE_PATH}:${_NIX_PATH}:${GUIX_PATH}:${MAC_PKG_PATH}:${SNAP_BIN_PATH}:${MAC_GNUBIN_PATH}:${USR_BIN_PATH}:${SYSTEM_BIN_PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
export PATH="${USER_BIN_PATH}:${COURSIER_PATH}:${CABAL_PATH}:${GHCUP_PATH}:${RUST_PATH}:${PATH}"

### dynamic path for ruby
# export PATH="$(ruby -e 'puts Gem.user_dir')/bin:${PATH}"
# export PATH="${HOME}/.rbenv/bin:${PATH}"
# if command -v rbenv &> /dev/null
# then
#     eval "$(rbenv init - --no-rehash)"
# fi

# 整理 PATH，删除重复路径
if [ -n "${PATH}" ]; then
    old_PATH=${PATH}:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}
        case ${PATH}: in
           *:"$x":*) ;;
           *) PATH=${PATH}:$x;;
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi
export PATH

# save PATH for
# 1. in case /etc/zprofile or /etc/zshrc overwrites PATH
# 2. just export it when loaded again
# 不需要 export, export 会影响子 shell
_ENV_PATH=${PATH}

## MANPATH is removed, it is not neccessary.
## if extra manuals are needed, set MANPATH as below
## export MANPATH="$(manpath):/other/manual/paths"
