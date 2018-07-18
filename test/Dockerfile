FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo

RUN apt-get update && apt-get install -y openssh-server && apt-get install -y supervisor
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "root:root" | chpasswd

ARG ssh_pub_key

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh

RUN echo "$ssh_pub_key" > /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN useradd -m hadoop && echo "hadoop:hadoop" | chpasswd && adduser hadoop sudo

RUN mkdir -p /home/hadoop/.ssh && \
    chmod 0700 /home/hadoop/.ssh

RUN echo "$ssh_pub_key" > /home/hadoop/.ssh/authorized_keys && \
    chmod 600 /home/hadoop/.ssh/authorized_keys

RUN chown -R hadoop /home/hadoop/