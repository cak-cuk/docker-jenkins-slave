FROM udienz/jenkins-slave:ubuntu2204
LABEL maintainer="Mahyuddin Susanto"

ARG user=jenkins
ARG group=jenkins
ARG uid=1001
ARG gid=1001
ARG JENKINS_AGENT_HOME=/home/jenkins
ENV TZ="UTC"
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# See https://github.com/geerlingguy/docker-ubuntu2204-ansible/blob/master/Dockerfile

RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime \
    && apt-get update \
    && apt-get upgrade -y \
    &&  apt-get install -y -q --no-install-recommends \
      git python3-pip locales libffi-dev libssl-dev libyaml-dev python3-dev default-jdk-headless \
      python3-setuptools python3-yaml iproute2 wget openssh-client sshpass \
      openssh-server \
    && locale-gen en_US.UTF-8 \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

USER jenkins
RUN export LC_ALL="en_US.UTF-8" \
    && echo "LC_ALL=en_US.UTF-8" >> $HOME/.bashrc \
    && export PATH="$HOME/bin:$HOME/.local/bin:$PATH" \
    && echo 'export PATH="$HOME/bin:$HOME/.local/bin:$PATH"' >> $HOME/.bashrc \
    && python3 -m pip install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir ansible ansible-lint molecule-docker

USER root
RUN mkdir -p /etc/ansible \
    && /bin/rm -v /etc/ssh/ssh_host_*

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
