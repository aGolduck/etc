ETC_REPO="${HOME}/g/w/etc"

mkdir -p ${ETC_REPO}
git clone https://github.com/aGolduck/etc.git ${ETC_REPO}
git clone https://github.com/zsh-users/antigen.git ~/g/zsh-users/antigen
echo "source ${ETC_REPO}/zsh/interactive.sh" >> ~/.zshrc
echo "source ${ETC_REPO}/zsh/env.sh" >> ~/.zshenv
mkdir -p ~/.config/plasma-workspace/env
echo "source ~/.zshenv" >> ~/.config/plasma-workspace/env/path.sh

tic -x -o ~/.terminfo ${ETC_REPO}/terminfo-24bit.src

#source ${ETC_REPO}/link.sh
