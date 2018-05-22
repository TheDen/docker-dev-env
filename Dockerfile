FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade \
 && apt-get -y install \
 bash-completion \
 build-essential \
 byobu \
 curl \
 git \
 git-core \
 golang \
 htop \
 jq \
 locales \
 man \
 nmap \
 npm \
 python-pip \
 python3-pip \
 ruby-full \
 shellcheck \
 strace \
 sudo \
 tig \
 vim \
 wget

RUN locale-gen en_US.UTF-8

# Install node and nvm
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Disable password and not ask for finger info
RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu

# Install vundle
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Pull down .vimrc if a URL is passed
ARG VIMRC
RUN test "$VIMRC" && curl -sL $VIMRC -o ~/.vimrc || :

# Hush login messages
RUN touch ~/.hushlogin

WORKDIR /home/ubuntu
