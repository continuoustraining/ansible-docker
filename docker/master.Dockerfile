# use builded ansible_base (defined in base.Dockerfile) as a starting point
FROM ansible_base:latest

# install ansible package
RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    software-properties-common \
    && apt-add-repository ppa:ansible/ansible

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    ansible

# change working directory
WORKDIR /var/ans

# generate RSA key pair to allow master to communicate with managed nodes
# default private key passphrase is '12345' (not a good idea for production environment ;)
RUN ssh-keygen -t rsa -N "" -C "master key" -f master_key

# allow root without login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN ssh-agent bash
