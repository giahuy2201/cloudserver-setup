cd ~ && \
git clone https://github.com/giahuy2201/dotfiles.git && \
cd dotfiles && \
stow -v -t $HOME --adopt */ && \
git checkout . && \
source $HOME/.bashrc