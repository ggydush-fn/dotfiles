FORTUNE="Make sure your code does nothing gracefully."
echo "
\|/          (__)
      \------(oo)  ${FORTUNE}
       ||    (__)
       ||w--||     \|/
   \|/
"

# ZSH configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true

plugins=(
    git
    osx
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source ~/.zshprompt

if (( $EUID == 0 )); then
    runuser -u ggydush -- /bin/zsh -l
    cd /home/ggydush
fi

