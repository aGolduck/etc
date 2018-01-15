sysOS=`uname -s`
echo $sysOS" initializing"
sudo usermod -aG vboxsf $(whoami)

shared_pkgs=("zsh" "vim" "emacs" "tmux" "autossh" "git" "silversearcher-ag" "tig" "graphviz" "autojump")
brew_pkgs=("node")
apt_pkgs=("nodejs" "docker.io" "docker-compose" "openjdk-8-jdk"
          "markdown")
for ((i=0; i<${shared_pkgs[*]}; i++))
do
	if [ $sysOS == "Darwin" ]; then
		brew install ${shared_pkgs[i]}
	elif [ %sysOS == "Linux" ]; then
		sudo apt install ${shared_pkgs[i]}
	fi
done

# use system node to install global package
npm_pkgs=("commitizen" "cz-conventional-changelog" "tern" "eslint" "babel-eslint" "eslint-plugin-react" "js-beautify" "yarn" "pm2"
          "vmd")
for ((i=0; i<${#npm_pkgs[*]}; i++))
do
    npm install ${npm_pkgs[i]} -g
done

#install nvm

#haskell mirror
#repository mirrors.tuna.tsinghua.edu.cn
#  url: http://mirrors.tuna.tsinghua.edu.cn/hackage

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
#git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
#ln -s ~/etc/spacemacs/ ~/.spacemacs.d

# vim
#ln -s ~/etc/vimrc ~/.vimrc

# zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/dev/share/oh-my-zsh
#ln -s ~/etc/zsh/zshrc.sh ~/.zshrc
#lt -s ~/etc/zsh/zshenv.sh ~/.zshenv

#chsh -s /usr/bin/zsh

# npm, yarn
#ln -s ~/etc/npmrc ~/.npmrc
#yarn config set registry 'https://registry.npm.taobao.org'

# git
#ln -s ~/etc/git/config ~/.gitconfig
#ln -s ~/etc/git/czrc ~/.czrc
