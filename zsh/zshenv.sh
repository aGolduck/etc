USER_BIN_PATH="/usr/local/bin:/usr/local/sbin"
SYSTEM_BIN_PATH="/usr/bin:/usr/sbin:/bin:/sbin"
PKG_PATH="/usr/pkg/bin:/usr/pkg/sbin"
export PATH="$PKG_PATH:$USER_BIN_PATH:$SYSTEM_BIN_PATH"
if [ "$USER" != root -o ! -w /nix/var/nix/db ]; then
    export NIX_REMOTE=daemon
fi
export NIX_USER_PROFILE_DIR="/nix/var/nix/profiles/per-user/$USER"
export NIX_PROFILES="/nix/var/nix/profiles/default $HOME/.nix-profile"
export NIX_SSL_CERT_FILE="/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt"
export NIX_PATH="/nix/var/nix/profiles/per-user/root/channels"
export PATH="$HOME/.nix-profile/bin:$HOME/.nix-profile/sbin:$HOME/.nix-profile/lib/kde4/libexec:/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/nix/var/nix/profiles/default/lib/kde4/libexec:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="/usr/pkg/man:$MANPATH"

export LANG=zh_CN.UTF-8
