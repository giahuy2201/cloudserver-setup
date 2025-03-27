# Assume logged in as root
echo "------------ Set up environment variables ------------"
MY_USER=giahuy
USER_SCRIPT=https://raw.githubusercontent.com/giahuy2201/cloudserver-setup/refs/heads/main/bootstrap-user.sh
echo "------------ Upgrade and install packages ------------"
apt update && \
apt install neovim neofetch git screen btop htop stow -y
echo "------------ Set up user with passwordless sudo ------------"
useradd -m $MY_USER && \
apt install sudo -y && \
echo "$MY_USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$MY_USER
echo "------------ Copy ssh key to user ------------"
mkdir -p /home/$MY_USER/.ssh && \
cp /root/.ssh/authorized_keys .ssh && \
chown -R $MY_USER:$MY_USER /home/$MY_USER
echo "------------ Bootstrap as user ------------"
curl -sL $USER_SCRIPT | sudo -u $MY_USER bash
echo "------------ Bootstrapping finished ------------"