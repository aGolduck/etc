export ANDROID_HOME="${HOME}/Library/Android/sdk"
export HOMEBREW_PREFIX="${HOME}/.homebrew"
export ANDROID_HOME=${HOME}/Library/Android/sdk
if [ -d /usr/lib/jvm/default ]
then
    export JAVA_HOME=/usr/lib/jvm/default
else
    export JAVA_HOME=/usr/lib/jvm/default-java
fi

export USR_BIN_PATH="/usr/local/bin:/usr/local/sbin"
export USER_BIN_PATH="${HOME}/bin:${HOME}/.local/bin"
export SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"
export NODE_MAC_STABLE_PATH="/usr/local/opt/node@10/bin"
export RUBY_MAC_STABLE_PATH="/usr/local/opt/ruby/bin"
export PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
export RUST_PATH="${HOME}/.cargo/bin"

### tuning
# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export HOMEBREW_NO_AUTO_UPDATE=1

export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"
export SASS_BINARY_SITE="https://npm.taobao.org/mirrors/node-sass"

# npm 全局包安装需满足两个条件: 1. 不需要系统权限, 2. 无需因为 node 版本升级/变化重装
# 将包安装在 ~/.local 下实现无需系统权限，而且实现多用户隔离
# 但是将 `prefix=~/.local` 配置在 ~/.npmrc 会导致 nvm 完全无法使用
# 在 zshrc 中配置 NPM_CONFIG_PREFIX 并在 bashrc 中 unset NPM_CONFIG_PREFIX
# 再将 nvm 的 loading 脚本的过程加到 bashrc
# 日常使用 zsh, 需要切换 node 版本使用 bash
# 满足日常 node 包的使用的稳定要求，也满足 node 开发版本的切换需求
export NPM_CONFIG_PREFIX=~/.local
