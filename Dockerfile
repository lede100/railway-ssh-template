FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y openssh-server && \
    echo 'root:abc123' | chpasswd && \
    sed -i 's/#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    mkdir /run/sshd && \
    apt-get clean
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
