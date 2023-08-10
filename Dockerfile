FROM ubuntu:22.04
MAINTAINER "roclee"
ENV MYPATH /usr/local
WORKDIR $MYPATH
RUN apt-get update
RUN apt install-y sudo
RUN apt install-y vim
RUN apt update
RUN apt install-y build-essential
RUN apt install-y net-tools
RUN apt install-y curl
RUN apt install -y sudo
RUN apt install -y systemctl
CMD echo $MYPATH
CMD /bin/bash