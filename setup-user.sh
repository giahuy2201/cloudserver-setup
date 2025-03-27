useradd -m $MY_USER && \
sudo apt install sudo -y && \
echo "$MY_USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$MY_USER