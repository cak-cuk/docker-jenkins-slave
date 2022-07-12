# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
# It is based on instructions from https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin and Dockerfile
# from https://hub.docker.com/r/evarga/jenkins-slave/
# Taken from https://raw.githubusercontent.com/mmhelm/docker-centos-slave/master/Dockerfile

FROM centos:7
ARG VERSION=4.13

# Install a basic SSH server GIT, UNZIP, LSOF and JDK 7
RUN yum install --nogpg -y openssh-server git unzip lsof \
        java-11-openjdk-headless sudo epel-release \
    && yum clean all

# Define location of the Oracle JDK
ENV JAVA_HOME /usr/java/default
# Define location of the Oracle JRE
ENV JRE_HOME /usr/java/default/jre

RUN yum install curl -y \
        && curl --create-dirs -fsSLo /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
        && chmod 755 /usr/share/jenkins \
        && chmod 644 /usr/share/jenkins/agent.jar \
        && ln -sf /usr/share/jenkins/agent.jar /usr/share/jenkins/slave.jar \
        && yum clean all

RUN curl -sSLo /usr/local/bin/jenkins-agent https://raw.githubusercontent.com/jenkinsci/docker-inbound-agent/master/jenkins-agent \
        && chmod +x /usr/local/bin/jenkins-agent \
        && ln -s /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave

# update sshd settings, create jenkins user, set jenkins user pw, generate ssh keys
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
    && mkdir -p /var/run/sshd \
    && useradd -u 1000 -m --home-dir /home/jenkins -s /bin/bash jenkins \
    && echo "jenkins:jenkins" | chpasswd

# Setup sudoers
RUN echo "Defaults:jenkins !requiretty" >> /etc/sudoers \
        && echo 'jenkins ALL=NOPASSWD: ALL' >> /etc/sudoers.d/jenkins \
        && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
        && sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Switch to user `jenkins`
USER jenkins

# Prepare the workspace for user `jenkins`
RUN mkdir -p /home/jenkins/.jenkins
VOLUME /home/jenkins/.jenkins
WORKDIR /home/jenkins

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]
