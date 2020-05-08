ln -si etc/share/gemrc ~/.gemrc
ln -si etc/share/gitconfig ~/.gitconfig
ln -si etc/share/mongorc.js ~/.mongorc.js
ln -si etc/share/tmux.conf ~/.tmux.conf
ln -si ../etc/share/vnc-xstartup.sh ~/.vnc/xstartup
ln -si etc/share/zshrc.sh ~/.zshrc
ln -si etc/share/pam_enviroment ~/.pam_enviroment

ln -si etc/share/emacs-profiles.el ~/.emacs-profiles.el
ln -si ../../../etc/share/desktops/spacemacs.desktop ~/.local/share/applications/spacemacs.desktop
ln -si ../../../etc/share/desktops/doom-emacs.desktop ~/.local/share/applications/doom-emacs.desktop
ln -si ../../../etc/share/desktops/centaur-emacs.desktop ~/.local/share/applications/centaur-emacs.desktop
ln -si ../../etc/share/xterm-24bits ~/.terminfo/78/xterm-24bits

mkdir -p ~/g ~/b ~/r
ln -si g ~/com.github
ln -si g ~/github
ln -si b ~/blob
ln -si r ~/repo
ln -si r ~/repository
ln -si ../g ~/r/com.github
