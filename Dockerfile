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

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs
RUN apt-get -y install software-properties-common && \
 apt-add-repository ppa:ansible/ansible && \
 apt-get update && \
 apt-get -y install ansible
