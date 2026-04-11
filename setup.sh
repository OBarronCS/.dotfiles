#!/bin/bash

# Exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command finished with exit code $?."' EXIT

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

function print_info {
    echo "--------------------"
    echo -e "${GREEN}$1${ENDCOLOR}"
    echo "--------------------"
}

# These lines will fail if they would override existing files
ln -s ~/.dotfiles/.vimrc ~/.vimrc 2>/dev/null || true
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 2>/dev/null || true
ln -s ~/.dotfiles/.inputrc ~/.inputrc 2>/dev/null || true
mkdir -p ~/.config/kitty
ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf 2>/dev/null || true


print_info "Installing fzf"
if [ ! -d "${HOME}/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
else
    print_info "fzf already installed"
fi

if command -v vim &> /dev/null; then
    print_info "Installing vim-plug"
    if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        # Need the shell redirections, otherwise there is chaos.
        # Causing outer script to fail, bash to not track where current command being run is (skips to random point)
        bash -c "vim -es -u ~/.vimrc +PlugInstall +qa" </dev/null >/dev/null 2>&1
    fi
fi

if command -v tmux &> /dev/null; then
    print_info "Installing tmux plugin manager"
    if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
        mkdir -p ~/.tmux/plugins
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

        # If currently in a tmux session, reload the config so the install succeeds
        if [ -n "$TMUX" ]; then
            tmux source-file ~/.tmux.conf
        fi

        ~/.tmux/plugins/tpm/bin/install_plugins
    fi
fi

# If we have sudo, and can run it without prompting
if command -v sudo &> /dev/null && sudo -n true 2> /dev/null; then
    # Install tmux bash autocomplete
    print_info "Installing tmux bash autocompletions"
    curl https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux | sudo tee /etc/bash_completion.d/tmux > /dev/null
fi

print_info "Done setting up .dotfiles"
