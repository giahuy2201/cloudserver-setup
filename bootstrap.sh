# Assume logged in as root
apt update && \
apt install git -y && \
git clone https://github.com/giahuy2201/cloudserver-setup.git

# Run scripts
cd cloudserver-setup && \
chmod +x *.sh && \
./upgrade.sh && \
./install-packages.sh && \
. ./env.sh && \
./setup-user.sh && \
# 
su $MY_USER && \
./setup-ssh.sh && \
./get-dotfiles.sh