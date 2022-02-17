sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && rm $HOME/.zshrc
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh.d/pure"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf/ && ~/.fzf/install --all --no-update-rc --no-bash --no-fish
ln -s $HOME/.zsh.d/.zshenv $HOME/.zshenv
