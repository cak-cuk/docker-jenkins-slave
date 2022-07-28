FROM eclipse-temurin:17-centos7

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG JENKINS_AGENT_HOME=/home/${user}

ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH="${JAVA_HOME}/bin:${HOME}/.local/bin:${HOME}/bin:${PATH}"

RUN export LC_ALL=en_US.UTF-8 \
    && yum makecache fast \
    && yum install epel-release -y \
    && yum install -y \
    sudo git git-lfs netcat openssh-server python3-pip \
    libselinux-python3 which iproute deltarpm initscripts \
    && yum clean all \
    && localedef -c -f UTF-8 -i en_US en_US.UTF-8

RUN for i in $(ls -1 "/lib/systemd/system/sysinit.target.wants/"); do \
    [ $i == systemd-tmpfiles-setup.service ] || \
    rm -f /lib/systemd/system/sysinit.target.wants/$i; \
    done; \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

# useradd -c "Jenkins user" -d /home/${user} -u ${uid} -g ${gid} -m ${user}
RUN groupadd -g ${gid} ${group} \
    && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m \
    -s /bin/bash "${user}" \
    && echo "Defaults:${user} !requiretty" >> /etc/sudoers \
    && echo "${user} ALL=NOPASSWD: ALL" >> /etc/sudoers.d/${user} \
    && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
    && sed -i /etc/ssh/sshd_config \
    -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
    -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
    -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
    -e 's/#LogLevel.*/LogLevel INFO/' \
    && echo "PATH=${PATH}" >> /etc/environment \
    && mkdir /var/run/sshd

RUN curl -sSLo /usr/local/bin/setup-sshd \
    https://raw.githubusercontent.com/jenkinsci/docker-ssh-agent/master/setup-sshd \
    && chmod +x /usr/local/bin/setup-sshd

WORKDIR "${JENKINS_AGENT_HOME}"

USER jenkins
RUN echo "PATH=$HOME/.local/bin:$HOME/bin:${JAVA_HOME}/bin:$PATH" >> $HOME/.bashrc \
    && pip3 install --no-cache-dir --user --upgrade pip \
    && pip3 install --no-cache-dir --user ansible ansible-lint yamllint molecule molecule-docker

VOLUME ["/sys/fs/cgroup", "${JENKINS_AGENT_HOME}", "/tmp", "/run", "/var/run"]

EXPOSE 22
ENTRYPOINT ["setup-sshd"]
CMD ["/usr/lib/systemd/systemd"]
