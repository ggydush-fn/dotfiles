curl -fsSL https://raw.githubusercontent.com/deluan/zsh-in-docker/master/zsh-in-docker.sh | sh
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh.d/pure"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf/ && ~/.fzf/install --all --no-bash
ln -s $HOME/.zsh.d/.zshenv $HOME/.zshenv
