FROM ubuntu:16.04

RUN apt-get update && \
      apt-get -y install sudo

RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y supervisor && \
    apt-get install -y default-jdk && \
    apt-get install -y iputils-ping && \
    apt-get install -y net-tools

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

ARG ssh_key
ARG ssh_pub_key

RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh

RUN echo "$ssh_key" > /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa
RUN echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa.pub
RUN echo "$ssh_pub_key" > /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN useradd -m hadoop && echo "hadoop:hadoop" | chpasswd && adduser hadoop sudo

RUN mkdir -p /home/hadoop/.ssh && \
    chmod 0700 /home/hadoop/.ssh
RUN echo "$ssh_pub_key" > /home/hadoop/.ssh/authorized_keys && \
    chmod 600 /home/hadoop/.ssh/authorized_keys

WORKDIR "/home/hadoop"

RUN wget http://apache.mindstudios.com/hadoop/common/hadoop-3.1.0/hadoop-3.1.0.tar.gz
RUN tar -xzf hadoop-3.1.0.tar.gz
RUN mv hadoop-3.1.0 hadoop

COPY node-master/configs/* /home/hadoop/hadoop/etc/hadoop/

RUN chown -R hadoop /home/hadoop/

ENV PATH "/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH"
ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64/jre"

ENV HDFS_NAMENODE_USER "root"
ENV HDFS_DATANODE_USER "root"
ENV HDFS_SECONDARYNAMENODE_USER "root"
ENV YARN_RESOURCEMANAGER_USER "root"
ENV YARN_NODEMANAGER_USER "root"

#USER hadoop
#WORKDIR "/home/hadoop"
#
#RUN hdfs namenode -format
#CMD ["start-dfs.sh"]




PATH="/home/hadoop/hadoop/bin:/home/hadoop/hadoop/sbin:$PATH"
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"

HDFS_NAMENODE_USER="root"
HDFS_DATANODE_USER="root"
HDFS_SECONDARYNAMENODE_USER="root"
YARN_RESOURCEMANAGER_USER="root"
YARN_NODEMANAGER_USER="root"