git clone https://github.com/wpchou/etc.git ~/.local/etc
echo "source ~/.local/etc/zsh/init.sh" >> ~/.zshrc
echo "source ~/.local/etc/zsh/path.sh" >> ~/.zprofile

git clone https://github.com/plexus/chemacs.git ~/g/plexus/chemacs
. ~/g/plexus/chemacs/install.sh

tic -x -o ~/.terminfo terminfo-24bit.src

source ./link.sh
