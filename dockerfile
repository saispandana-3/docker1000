FROM ubuntu:latest

# Install SSH server and sudo
RUN apt-get update && apt-get install -y openssh-server sudo

# Create SSH directory and set up password for root or a user
RUN mkdir /var/run/sshd
RUN echo 'root:rootpassword' | chpasswd

# Permit root login via SSH and password authentication
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start sshd in foreground
CMD ["/usr/sbin/sshd", "-D"]


