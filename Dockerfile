FROM ubuntu:18.04

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


# Install node and nvm
# Disable password and not ask for finger info
RUN locale-gen en_US.UTF-8 \
      && curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs \
      && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
      && adduser --disabled-password --gecos '' ubuntu \
      && adduser ubuntu sudo \
      && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu

# Install vundle
# Pull down .vimrc if a URL is passed
# Hush login messages
ARG VIMRC
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim \
      && test "$VIMRC" && curl -sL $VIMRC -o ~/.vimrc || : \
      && touch ~/.hushlogin

WORKDIR /home/ubuntu
