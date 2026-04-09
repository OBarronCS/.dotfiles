#!/bin/bash

# These lines will fail if they would override existing files
ln -s ~/.dotfiles/.vimrc ~/.vimrc 
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 
ln -s ~/.dotfiles/.inputrc ~/.inputrc
mkdir -p ~/.config/kitty
ln -s ~/.dotfiles/kitty.conf ~/.config/kitty/kitty.conf

# Install fzf
if [ ! -d "${HOME}/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi


# If we have sudo, and can run it without prompting
if command -v sudo &> /dev/null && sudo -n true 2> /dev/null; then
    # Install tmux bash autocomplete
    curl https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux | sudo tee /etc/bash_completion.d/tmux > /dev/null
fi
 
# Install vim-plug
if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    vim +'PlugInstall --sync' +qa
fi

# Install tmux plugin manager
if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ~/.tmux/plugins/tpm/bin/install_plugins
fi



