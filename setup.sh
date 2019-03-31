# set up syncthing first
sysOS=`uname -s`
echo $sysOS" initializing"
sudo usermod -aG vboxsf $(whoami)

mkdir -pv ~/etc/share
mkdir -pv ~/usr/share
git clone https://github.com/zsh-users/antigen.git $HOME/usr/share/antigen

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
    "wmctrl"
)
for ((i=0; i<${shared_pkgs[*]}; i++))
do
	if [ $sysOS == "Darwin" ]; then
		brew install ${shared_pkgs[i]}
	elif [ %sysOS == "Linux" ]; then
		sudo apt install ${shared_pkgs[i]}
	fi
done
#pip mirror
#/etc/pip.conf ~/.config/pip/pip.conf
pip2_pkgs=(
    "wakatime"
    "percol"
)
pip3_pkgs=(
)

#npm mirror
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

#install nvm

#stack setup
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

#git clone git@gitlab.com:wpchou/etc-share.git ~/etc/share

# emacs
#git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
#ln -s ~/etc/share/spacemacs/ ~/.spacemacs.d

# vim
#ln -s ~/etc/share/vimrc ~/.vimrc

# zsh
#git clone https://github.com/robbyrussell/oh-my-zsh.git ~/usr/share/oh-my-zsh
#ln -s ~/etc/share/zsh/zshrc.sh ~/.zshrc
#ln -s ~/etc/share/zsh/zshenv.sh ~/.zshenv

#chsh -s /usr/bin/zsh

# npm, yarn
#ln -s ~/etc/share/npmrc ~/.npmrc
#yarn config set registry 'https://registry.npm.taobao.org'
for ((i=0; i<${#npm_pkgs[*]}; i++))
do
    npm install ${npm_pkgs[i]} -g
done
ln -s ~/etc/share/noderc ~/.noderc

# git
#ln -s ~/etc/share/git/config ~/.gitconfig
#ln -s ~/etc/share/git/czrc ~/.czrc

# ssh
ln -s ~/Sync/config/ssh-config ~/.ssh/config

# tools
ln -s ~/etc/share/tmux.conf ~/.tmux.conf
