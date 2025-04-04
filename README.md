# cloudserver-setup

## 1. Run bootstrapping script

Log in to new server as root and run script to set up user

```sh
curl https://raw.githubusercontent.com/giahuy2201/cloudserver-setup/refs/heads/main/scripts/bootstrap.sh | sh
```

## 2. Install docker

```sh
curl https://raw.githubusercontent.com/giahuy2201/cloudserver-setup/refs/heads/main/scripts/install-docker-debian.sh | sh
```

## 3. Use ansible to upload docker config

Customize server configs in `host_vars/newserver.yml` and run ansible playbook

```sh
ansible-galaxy collection install -r requirements.yml
ansible-playbook playbook-prepare.yml -i inventory.yml
```