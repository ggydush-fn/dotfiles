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
)

source $ZSH/oh-my-zsh.sh
source ~/.zshprompt

