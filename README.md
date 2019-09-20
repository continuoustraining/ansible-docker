# ansible-docker
Ansible training (using containers)

Build and run all containers in background

`docker-compose up -d`

Connect to master node:

`docker-compose exec master bash`

Check your ansible version:

`ansible --version`

Verify if network connection is working between master and managed hosts:

`ping -c 2 host01`

Start an SSH Agent on master node to handle SSH keys protected by passphrase:

`ssh-agent bash`

Load private key into SSH Agent in order to allow establishing connections without entering key passphrase every time:

`ssh-add master_key`

`Enter passphrase for master_key:`

ssh key password : `12345`