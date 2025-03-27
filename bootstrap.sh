# Assume logged in as root
apt update && \
./install-packages.sh
git clone https://github.com/giahuy2201/cloudserver-setup.git && \
cd cloudserver-setup && \
# Run scripts
chmod +x *.sh && \
./setup-env.sh && \
./setup-user.sh && \
# 
su $MY_USER && \
./setup-ssh.sh && \
./get-dotfiles.sh