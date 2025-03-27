# Assume logged in as root
apt update && \
apt install git -y && \
git clone https://github.com/giahuy2201/cloudserver-setup.git && \
cd cloudserver-setup && \
# Run scripts
chmod +x *.sh && \
./install-packages.sh
./setup-env.sh && \
./setup-user.sh && \
# 
su $MY_USER && \
./setup-ssh.sh && \
./get-dotfiles.sh