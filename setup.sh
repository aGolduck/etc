sysOS=`uname -s`
echo $sysOS" initializing"
sudo usermod -aG vboxsf $(whoami)

shared_pkgs=(
    "autojump"
    "autossh"
    "emacs"
    "git"
    "graphviz"
    "silversearcher-ag"
    "tig"
    "tmux"
    "vim"
    "zsh"
)
brew_pkgs=(
    "node"
)
apt_pkgs=(
    "docker.io"
    "docker-compose"
    "nodejs"
    "openjdk-8-jdk"
)
for ((i=0; i<${shared_pkgs[*]}; i++))
do
	if [ $sysOS == "Darwin" ]; then
		brew install ${shared_pkgs[i]}
	elif [ %sysOS == "Linux" ]; then
		sudo apt install ${shared_pkgs[i]}
	fi
done
pip2_pkgs=(
    "wakatime"
    "percol"
)

npm_pkgs=(
    "babel-eslint"
    "commitizen"
    "cz-conventional-changelog"
    "eslint"
    "eslint-plugin-react"
    "js-beautify"
    "pm2"
    "tern"
    "yarn"
)
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
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/share/oh-my-zsh
#ln -s ~/etc/zsh/zshrc.sh ~/.zshrc
#ln -s ~/etc/zsh/zshenv.sh ~/.zshenv

#chsh -s /usr/bin/zsh

# npm, yarn
#ln -s ~/etc/npmrc ~/.npmrc
#yarn config set registry 'https://registry.npm.taobao.org'

# git
#ln -s ~/etc/git/config ~/.gitconfig
#ln -s ~/etc/git/czrc ~/.czrc
