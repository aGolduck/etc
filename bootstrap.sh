echo "source ~/.local/xxx/init.sh" >> ~/.zshrc

mkdir -p ~/.ssh
ssh-keygen -q -t rsa -b 4096 -N '' -f ~/.ssh/ali1_rsa 2>/dev/null <<< y >/dev/null
ssh-keygen -q -t rsa -b 4096 -N '' -f ~/.ssh/imac_rsa 2>/dev/null <<< y >/dev/null
ssh-keygen -q -t rsa -b 4096 -N '' -f ~/.ssh/mmac_rsa 2>/dev/null <<< y >/dev/null
ssh-keygen -q -t rsa -b 4096 -N '' -f ~/.ssh/mo_rsa 2>/dev/null <<< y >/dev/null
ssh-keygen -q -t rsa -b 4096 -N '' -f ~/.ssh/tc1_rsa 2>/dev/null <<< y >/dev/null
ssh-keygen -q -t rsa -b 4096 -N '' -f ~/.ssh/xps_rsa 2>/dev/null <<< y >/dev/null

source ./link.sh
