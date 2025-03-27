echo "------------ Copy ssh key to user ------------"
cd ~ && \
mkdir -p .ssh && \
cp /root/.ssh/authorized_keys .ssh
echo "------------ Get dotfiles ------------"
git clone https://github.com/giahuy2201/dotfiles.git && \
cd dotfiles && \
stow -v -t $HOME */