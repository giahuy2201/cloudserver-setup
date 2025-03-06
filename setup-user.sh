sudo apt update && \
sudo apt install sudo -y && \
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER