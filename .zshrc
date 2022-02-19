export ZSH="$HOME/.oh-my-zsh"

# Pure zsh prompt: https://github.com/sindresorhus/pure
fpath+=$HOME/.zsh.d/pure
autoload -U promptinit; promptinit
prompt pure
export PURE_PROMPT_SYMBOL=">"
# Make ls/tab completion colors prettier (blue instead of red)
export LS_COLORS="di=1;34:ln=1;36:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
export LSCOLORS="ExGxBxDxCxEgEdx"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

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

if which fortune >/dev/null; then
    FORTUNE=$(fortune -n 62 -s computers science wisdom fortunes  | tr '\r\n\t' ' ')
else
    FORTUNE="Comma ti yi yi yeah. Comma ti yippity yi yeah."
fi
echo "
\|/          (__)
      \------(oo)  ${FORTUNE}
       ||    (__)
       ||w--||     \|/
   \|/"

### TOOL STARTUP/CONFIGURATION
for DIR in /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk $HOME/google-cloud-sdk
do
    [ -d $DIR ] && source $DIR/path.zsh.inc && source $DIR/completion.zsh.inc
done

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
