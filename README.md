# cloudserver-setup
My routines to migrate cloud-hosted servers

## 0. Wrap up old VPS
- Copy `authorized_keys`
- Back up ufw rules https://linuxconfig.org/how-to-backup-and-restore-ufw-on-linux
- Back up wazuh-agent
- ~~Back up docker data `~/config`~~ (now handled by Syncthing)
- Docker compose down

## 1. Bootstrap new VPS

Log in as root

```sh
curl https://raw.githubusercontent.com/giahuy2201/cloudserver-setup/refs/heads/main/scripts/bootstrap.sh | sh
```

Install docker using official script

```sh
curl -fsSL https://get.docker.com | sh
sudo systemctl enable --now docker
sudo usermod -a -G docker $USER
```

## 2. Upload docker data using Ansible

Customize server configs in `host_vars/newserver.yml` and `inventory.yml` then run ansible playbook

```sh
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbook-prepare.yml -i inventory.yml
```
