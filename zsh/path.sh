export ANDROID_HOME=${HOME}/Library/Android/sdk

USR_BIN_PATH="/usr/local/bin:/usr/local/sbin"
USER_BIN_PATH="${HOME}/bin:${HOME}/.local/bin"
SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin:/snap/bin"
NODE_MAC_STABLE_PATH="/usr/local/opt/node@10/bin"
RUBY_MAC_STABLE_PATH="/usr/local/opt/ruby/bin"
PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
RUST_PATH="${HOME}/.cargo/bin"

export PATH="${RUST_PATH}:${USER_BIN_PATH}:${NODE_MAC_STABLE_PATH}:${RUBY_MAC_STABLE_PATH}:${PKG_PATH}:${USR_BIN_PATH}:${SYSTEM_BIN_PATH}:${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools"
### linuxbrew packages should not be preferred
# export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
# export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
# export INFOPATH="/home/linuxbrew/.linuxbrew/share/info${INFOPATH+:$INFOPATH}";

### dynamic path
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:${PATH}"
export PATH="${HOME}/.rbenv/bin:${PATH}"
eval "$(rbenv init - --no-rehash)"

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
