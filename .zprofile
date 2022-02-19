# Source .zsh files if they exist (useful for domain-specific configuration)
test -n "$(find ~/.zsh.d/ -maxdepth 1 -name '*.zsh')" && source <(cat $HOME/.zsh.d/*.zsh)

### ENVIRONMENT VARIABLES
export POETRY_VIRTUALENVS_PATH="$HOME/.virtualenvs"
export POETRY_VIRTUALENVS_IN_PROJECT=false
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

### ALIASES
alias prune="docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi -f"
alias update="source ~/.zsh.d/.zshrc"
alias cdd='cd ~/dyson-sync/dev/'

### TOOL STARTUP/CONFIGURATION
if [ -d '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
if which pyenv >/dev/null; then
    eval "$(pyenv init - --no-rehash)"
    export PATH=$(pyenv root)/shims:$PATH
fi

kubectl () {
    # Lazy load kubectl completions
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi
    command kubectl "$@"
}

kns () {
	(
		[ -n "$1" ] && kubectl config set-context --current --namespace=$1
	) || (
		echo "Context: $(kubectl config current-context)" && kubectl get ns
	)
}

vtxt () {
  tabview $1
}
