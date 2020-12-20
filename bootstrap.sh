git clone https://github.com/wpchou/etc.git ~/.local/etc
git clone https://github.com/zsh-users/antigen.git ~/g/zsh-users/antigen
echo "source ~/.local/etc/zsh/init.sh" >> ~/.zshrc
echo "source ~/.local/etc/zsh/variables.sh" >> ~/.zprofile
echo "source ~/.local/etc/zsh/path.sh" >> ~/.zprofile
mkdir -p ~/.config/plasma-workspace/env
echo "source ~/.zprofile" >> ~/.config/plasma-workspace/env/path.sh

tic -x -o ~/.terminfo ~/.local/etc/terminfo-24bit.src

source ~/.local/etc/link.sh
