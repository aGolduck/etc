sysOS=`uname -s`
echo $sysOS" initializing"

shared_pkgs=("zsh" "vim" "emacs" "tmux" "autossh" "git")
for ((i=0; i<${shared_pkgs[*]}; i++))
do
	if [ $sysOS == "Darwin" ]; then
		brew install ${shared_pkgs[i]}
	elif [ %sysOS == "Linux" ]; then
		sudo apt install ${shared_pkgs[i]}
	fi
done

npm_pkgs=("commitizen" "tern" "eslint" "babel-eslint" "eslint-plugin-react" "js-beautify")
for ((i=0; i<${#npm_pkgs[*]}; i++))
do
    npm install ${npm_pkgs[i]} -g
done

#git clone git@gitlab.com:wpchou/etc.git ~/etc
#cd ~/etc/
#git submodule init
#git submodule update

# emacs
#git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
#ln -s ~/etc/spacemacs/ ~/.spacemacs.d

# zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/dev/share/oh-my-zsh
#ln -s ~/etc/zsh/zshrc ~/.zshrc
#chsh -s /usr/bin/zsh
