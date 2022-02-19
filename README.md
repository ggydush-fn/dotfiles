### Installation

This repo enables configuration of dotfiles in Vscode dev containers (see [docs](https://code.visualstudio.com/docs/remote/containers#_personalizing-with-dotfile-repositories))
but can also be installed on any Mac/Linux system with the following command:

```zsh
git clone https://github.com/ggydush-fn/dotfiles.git ~/.zsh.d/
cd ~/.zsh.d/ && sh install.sh
```

Since the directory is tracked with `git`, updating should be possible with just a `git pull`.

Other CLI tools like `kubectx`, `bat`, `tldr`, etc. can be installed separately with brew/apt.
