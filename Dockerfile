FROM ubuntu:16.04

RUN apt-get update \
 && apt-get -y install \
 build-essential \
 vim \
 curl \
 wget \
 jq \
 git \ 
 git-core \
 bash-completion

RUN apt-get -y install golang 
 
RUN apt-get -y install python-pip

RUN apt-get -y install ruby-full

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get install -y nodejs  && \
 python-pip \

RUN apt-get -y install software-properties-common && \
 apt-add-repository ppa:ansible/ansible && \
 apt-get update && \
 apt-get -y install ansible
