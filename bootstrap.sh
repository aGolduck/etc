git clone https://github.com/wpchou/etc.git ~/.local/etc
git clone https://github.com/zsh-users/antigen.git ~/g/zsh/antigen
echo "source ~/.local/etc/zsh/init.sh" >> ~/.zshrc
echo "source ~/.local/etc/zsh/path.sh" >> ~/.zprofile

tic -x -o ~/.terminfo terminfo-24bit.src

source ./link.sh
