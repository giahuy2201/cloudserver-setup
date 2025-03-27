# Assume logged in as root
echo "------------ Set up environment variables ------------"
MY_USER=giahuy
TMP_DIR=$(mktemp -d)
echo "------------ Clone the repo ------------"
apt update && \
apt install git -y && \
git clone https://github.com/giahuy2201/cloudserver-setup.git "$TMP_DIR"
cd cloudserver-setup && \
chmod +x *.sh && \
echo "------------ Upgrade and install packages ------------"
apt install neovim neofetch git screen btop htop stow -y
echo "------------ Set up user with passwordless sudo ------------"
useradd -m $MY_USER && \
apt install sudo -y && \
echo "$MY_USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$MY_USER
echo "------------ Copy ssh key to user ------------"
su $MY_USER && \
cp /root/.ssh/authorized_keys /home/$MY_USER/.ssh
echo "------------ Get dotfiles ------------"
cd ~ && \
git clone https://github.com/giahuy2201/dotfiles.git && \
cd dotfiles && \
stow -v -t $HOME */
echo "------------ Bootstrapping finished ------------"