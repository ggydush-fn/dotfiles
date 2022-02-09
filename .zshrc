FORTUNE=$(fortune -n 62 -s computers science wisdom fortunes  | tr '\r\n\t' ' ')
echo "
\|/          (__)
      \------(oo)  ${FORTUNE}
       ||    (__)
       ||w--||     \|/
   \|/
"
export ZSH="$HOME/.oh-my-zsh"

# Pure zsh prompt: https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
export PURE_PROMPT_SYMBOL=">"

# Other installs:
# brew: bat, fzf, j, figlet, tldr, jump
# manual: z, poetry
plugins=(
    colored-man-pages
    extract
    docker
    docker-compose
    poetry
    web-search
    z
    zsh-syntax-highlighting
)

export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
export LSCOLORS="ExGxBxDxCxEgEdx"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# # The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ];
then . "$HOME/google-cloud-sdk/path.zsh.inc";
fi

if [ -f "$HOME/.pyenv" ];
then
    # All the Python fixings
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init - --no-rehash)"
    export PATH=$(pyenv root)/shims:$PATH
fi

export PATH="$HOME/.poetry/bin:$PATH"

function kubectl() {
    # Lazy load kubectl completions
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi
    command kubectl "$@"
}


