# Assume logged in as root
echo "------------ Set up environment variables ------------"
MY_USER=giahuy
USER_SCRIPT=https://raw.githubusercontent.com/giahuy2201/cloudserver-setup/refs/heads/main/scripts/bootstrap-user.sh
echo "------------ Upgrade and install packages ------------"
apt update && \
apt install neovim neofetch git screen btop htop stow rsync -y
echo "------------ Set up user with passwordless sudo ------------"
groupadd -g 1000 $MY_USER && \
useradd -m -s "$(which bash)" -u 1000 -g $MY_USER $MY_USER
apt install sudo -y && \
echo "$MY_USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$MY_USER
echo "------------ Bootstrap as user ------------"
curl -sL $USER_SCRIPT | sudo -u $MY_USER bash
echo "------------ Bootstrapping finished ------------"