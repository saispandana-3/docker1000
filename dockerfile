FROM ubuntu:latest

# Install SSH and sudo
RUN apt-get update && \
    apt-get install -y openssh-server sudo && \
    mkdir /var/run/sshd

# Set root password to 'root'
RUN echo 'root:root' | chpasswd

# Permit root login over SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

