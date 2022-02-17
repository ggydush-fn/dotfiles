export ZSH="$HOME/.oh-my-zsh"

# Pure zsh prompt: https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh.d/pure
autoload -U promptinit; promptinit
prompt pure
export PURE_PROMPT_SYMBOL=">"
export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
export LSCOLORS="ExGxBxDxCxEgEdx"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Other installs:
# brew: bat, fzf, figlet, tldr
plugins=(
    colored-man-pages
    extract
    docker
    docker-compose
    web-search
    zsh-syntax-highlighting
    z
)
source $ZSH/oh-my-zsh.sh

# All the Python fixings
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
if which pyenv >/dev/null; then
    eval "$(pyenv init - --no-rehash)"
    export PATH=$(pyenv root)/shims:$PATH
fi

# Other tools
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if which fortune >/dev/null; then
    FORTUNE=$(fortune -n 62 -s computers science wisdom fortunes  | tr '\r\n\t' ' ')
else
    FORTUNE="Code code code..."
fi
echo "
\|/          (__)
      \------(oo)  ${FORTUNE}
       ||    (__)
       ||w--||     \|/
   \|/
"
