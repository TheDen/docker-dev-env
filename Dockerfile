FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade \
 && apt-get -y install \
 build-essential \
 htop \
 vim \
 shellcheck \
 curl \
 wget \
 jq \
 git \
 git-core \
 bash-completion \
 byobu \
 golang \
 python-pip \
 python3-pip \
 ruby-full \
 nmap \
 npm \
 strace \
 man

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
#RUN npm install -g n
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
# Ansible is deprecated
#RUN apt-get -y install software-properties-common && \
# apt-add-repository ppa:ansible/ansible && \
# apt-get update && \
# apt-get -y install ansible
