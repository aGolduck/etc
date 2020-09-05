ETC_REPO='.local/etc'

mkdir -p ~/.vnc
ln -si ${ETC_REPO}/gemrc ~/.gemrc
ln -si ${ETC_REPO}/gitconfig ~/.gitconfig
ln -si ${ETC_REPO}/mongorc.js ~/.mongorc.js
ln -si ${ETC_REPO}/tmux.conf ~/.tmux.conf
ln -si ../${ETC_REPO}/vnc-xstartup.sh ~/.vnc/xstartup
ln -si ${ETC_REPO}/pam_enviroment ~/.pam_enviroment

mkdir -p ~/.local/share/applications
# ln -si ${ETC_REPO}/emacs-profiles.el ~/.emacs-profiles.el
# ln -si ../../../${ETC_REPO}/desktops/spacemacs.desktop ~/.local/share/applications/spacemacs.desktop
# ln -si ../../../${ETC_REPO}/desktops/doom-emacs.desktop ~/.local/share/applications/doom-emacs.desktop
# ln -si ../../../${ETC_REPO}/desktops/centaur-emacs.desktop ~/.local/share/applications/centaur-emacs.desktop
ln -si ../../../${ETC_REPO}/desktops/org-protocol.desktop ~/.local/share/applications/org-protocol.desktop
ln -si ~/Applications/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

# TODO 这种 link 方法不具备幂等性
mkdir -p ~/g ~/b ~/r
ln -si g ~/github.com
ln -si g ~/github
ln -si b ~/blob
ln -si r ~/repo
ln -si r ~/repository
ln -si ../g ~/r/github.com
