# cloudserver-setup
My routines to migrate cloud-hosted servers from one provider to another. To simplify, the whole process

## 0. Run provider-specific routine
- Create/Rename your user with uid:gid 1000:1000
- Disable PasswordAuthentication
- Copy ssh pubkeys
- Back up ufw rules https://linuxconfig.org/how-to-backup-and-restore-ufw-on-linux
- Back up wazuh-agent

## 1. Run bootstrapping script

Log in to new server as root and run script to set up user

```sh
curl https://raw.githubusercontent.com/giahuy2201/cloudserver-setup/refs/heads/main/scripts/bootstrap.sh | sh
```

## 2. Install docker

```sh
curl -fsSL https://get.docker.com | sh
sudo systemctl enable --now docker
sudo usermod -a -G docker $USER
```

## 3. Use ansible to upload docker config

Customize server configs in `host_vars/newserver.yml` and `inventory.yml` then run ansible playbook

```sh
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbook-prepare.yml -i inventory.yml
```
