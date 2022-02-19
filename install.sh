ENV_FILE=$HOME/.zshenv
# Expected params: URL, destination
clone_to_dir () {
    [ ! -d $2 ] && git clone $1 $2
}

if [ ! -d $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && rm $HOME/.zshrc
fi
clone_to_dir https://github.com/sindresorhus/pure.git "$HOME/.zsh.d/pure"
clone_to_dir https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
clone_to_dir https://github.com/junegunn/fzf.git ~/.fzf/ && ~/.fzf/install --all --no-update-rc --no-bash --no-fish
if [ ! -f $ENV_FILE ];then
    ln -s $HOME/.zsh.d/.zshenv $ENV_FILE
else
    echo "$ENV_FILE file already exists. Skipping. If not set already, add ZDOTDIR=~/.zsh.d/ to $ENV_FILE"
fi
source ~/.zsh.d/.zshrc

