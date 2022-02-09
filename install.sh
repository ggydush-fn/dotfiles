# /bin/zsh
# Install ohmyzsh
sudo apt-get update && apt-get install -y curl fortune
curl -fsSL https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh | sh
cp ~/dotfiles/.zsh* ~

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
