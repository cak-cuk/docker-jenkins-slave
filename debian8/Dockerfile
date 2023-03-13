# Generated in Tue Jun 28 05:04:53 AM UTC 2022
# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM udienz/buildpack:debian8

ENV TZ="UTC"
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install and configure a basic SSH server
RUN apt-get update && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    apt-get install -y -q --no-install-recommends openssh-server git \
        subversion bzr mercurial cvs sudo build-essential default-jdk-headless &&\
    apt-get clean -y && rm -rf /var/lib/apt/lists/* &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

# Set user jenkins to the image
RUN adduser --quiet --disabled-password --gecos '' jenkins \
    && echo "jenkins:jenkins" | chpasswd \
    && echo 'jenkins ALL=NOPASSWD: ALL' > /etc/sudoers.d/jenkins

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
