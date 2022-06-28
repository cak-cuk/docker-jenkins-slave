# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
# It is based on instructions from https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin and Dockerfile
# from https://hub.docker.com/r/evarga/jenkins-slave/

FROM udienz/buildpack:centos7
MAINTAINER Mahyuddin Susanto <udienz@gmail.com>

# Install a basic SSH server GIT, UNZIP, LSOF and JDK 7
RUN yum install --nogpg -y openssh-server git unzip lsof java-1.7.0-openjdk-headless sudo epel-release \
    subversion bzrtools mercurial cvs perl rubygems ruby ruby-devel rubygems && yum clean all
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

#RUN gem install bundler
WORKDIR /tmp
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz \
    && tar xzf /tmp/ruby-install-0.6.0.tar.gz && cd ruby-install-0.6.0 && make install \
    && ruby-install --system --latest ruby \
    && gem install --no-ri --no-rdoc bundler \
    && gem update --system \
    && rm -rf /tmp/ruby-install* \
    && ruby --version

# Standard SSH port
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
