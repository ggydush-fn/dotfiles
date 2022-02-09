# /bin/zsh
# Install ohmyzsh
apt-get update && apt-get install -y wget fortune
sh -c "$(wget -O- https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh)"
cp ~/dotfiles/.zsh* ~
