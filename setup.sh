#pkgs=("zsh" "vim" "emacs" "tmux" "autossh" "git")
#for ((i=0; i<${#pkgs[*]}; i++))
#do
#	brew install ${pkgs[i]}
#done

#git clone git@gitlab.com:wpchou/etc.git ~/etc
#cd ~/etc/
#git checkout origin/macos
#git checkout -b macos
#git submodule init
#git submodule update

# emacs
#git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
#ln -s ~/etc/spacemacs/ ~/.spacemacs.d

# zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/dev/share/oh-my-zsh
#ln -s ~/etc/zshrc ~/.zshrc
#chsh -s /usr/bin/zsh
