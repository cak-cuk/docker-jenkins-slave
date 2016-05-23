# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM ubuntu:trusty
MAINTAINER Mahyuddin Susanto <udienz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install apt-transport-https ca-certificates openssh-server default-jdk --no-install-recommends -y -qq \
    && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
    && mkdir -p /var/run/sshd

# Install docker
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
    && echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list \
    && apt-get update > /dev/null \
    && apt-get install docker-engine -y > /dev/null

# Set user jenkins to the image
RUN adduser --quiet --disabled-password --gecos '' jenkins \
    && echo "jenkins:jenkins" | chpasswd \
    && echo 'jenkins ALL=NOPASSWD: ALL' > /etc/sudoers.d/jenkins

# Clean up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
