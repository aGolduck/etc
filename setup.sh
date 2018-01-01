sysOS=`uname -s`
echo $sysOS" initializing"

shared_pkgs=("zsh" "vim" "emacs" "tmux" "autossh" "git")
brew_pkgs=("node")
apt_pkgs=("nodejs" "nodejs-legacy" "npm" "docker.io" "docker-compose")
for ((i=0; i<${shared_pkgs[*]}; i++))
do
	if [ $sysOS == "Darwin" ]; then
		brew install ${shared_pkgs[i]}
	elif [ %sysOS == "Linux" ]; then
		sudo apt install ${shared_pkgs[i]}
	fi
done

npm_pkgs=("commitizen" "tern" "eslint" "js-beautify" "typings")
for ((i=0; i<${#npm_pkgs[*]}; i++))
do
    npm install ${npm_pkgs[i]} -g
done

#install nvm
repository mirrors.tuna.tsinghua.edu.cn
  url: http://mirrors.tuna.tsinghua.edu.cn/hackage

#haskell mirror

#docker mirror
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://tdwvpwww.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

#git clone git@gitlab.com:wpchou/etc.git ~/etc
#cd ~/etc/
#git submodule init
#git submodule update

# emacs
#git clone https://github.com/zilongshanren/spacemacs.git ~/.emacs.d
#ln -s ~/etc/spacemacs/ ~/.spacemacs.d

# vim
#ln -s ~/etc/vimrc ~/.vimrc

# zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/dev/share/oh-my-zsh
#ln -s ~/etc/zsh/zshrc.sh ~/.zshrc
#lt -s ~/etc/zsh/zshenv.sh ~/.zshenv

#chsh -s /usr/bin/zsh
