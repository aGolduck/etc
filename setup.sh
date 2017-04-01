# edit /etc/hosts.allow
# reverse ssh if necessary, do not use sshd, it's not ok yet
# sudo service ssh --ful-restart
# autossh -M 20000 -CfnNT -R remote_host_binding_port:localhost:localhost_sshd_port wenpin@remote_host -p remote_host_sshd_port
pkgs=("vim" "emacs" "tmux" "autossh" "git")

for ((i=0; i<${#pkgs[*]}; i++))
do
	sudo apt install ${pkgs[i]}
done

#ln -s ~/etc/zshrc ~/.zshrc
#enable zsh
#if [ -t 1 ]; then
#	exe zsh
#fi
#git clone git@gitlab.com/wpchou/etc.git ~/etc
#git clone htts://github.com/robbyrussell/oh-my-zsh.git ~/dev/share/oh-my-zsh
#git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
#ln -s ~/etc/spacemacs ~/.spacemacs.d
