if [ -z ${_INHERITED_PATH+x} ]; then
    _INHERITED_PATH=${PATH}
fi

export PATH="${RUST_PATH}:${USER_BIN_PATH}:${NODE_MAC_STABLE_PATH}:${RUBY_MAC_STABLE_PATH}:${PKG_PATH}:${SNAP_BIN_PATH}:${USR_BIN_PATH}:${SYSTEM_BIN_PATH}:${_INHERITED_PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools${_TRAILING_PATH}"

### linuxbrew packages should not be preferred
# export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}";
# export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:";
# export INFOPATH="/home/linuxbrew/.linuxbrew/share/info${INFOPATH+:$INFOPATH}";

### dynamic path
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
