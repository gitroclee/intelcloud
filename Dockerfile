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
RUN apt install -y sudoRUN apt install -y systemctlRUN curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add - 
RUN apt-get install -y software-properties-common
RUN sudo add-apt-repository \
"deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/ \
$(Isb release -cs) \
stable"
RUN apt-get install -y docker-ce docker-ce-cli containerd.io
RUN mkdir -p /etc/docker
RUN tee /etc/docker/daemon.json <<-'EOF'
{
"registry-mirrors":["https://81s10g1.mirror.aliyuncs.com"
}
EOF
RUN systemctl daemon-reload
RUN systemctl restart docker
CMD echo $MYPATH
CMD echo "----end---"
CMD /bin/bash