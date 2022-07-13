FROM amd64/eclipse-temurin:11-jdk-centos7 AS jre-build

RUN yum install epel-release -y \
        && yum install -y \
        sudo git git-lfs netcat openssh-server \
        && yum clean all

RUN groupadd -g ${gid} ${group} \
        && useradd -d "${JENKINS_AGENT_HOME}" -u "${uid}" -g "${gid}" -m \
        -s /bin/bash "${user}" \
        && echo "Defaults:jenkins !requiretty" >> /etc/sudoers \
        && echo 'jenkins ALL=NOPASSWD: ALL' >> /etc/sudoers.d/jenkins \
        && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
        && sed -i /etc/ssh/sshd_config \
        -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
        -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
        -e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
        -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
        -e 's/#LogLevel.*/LogLevel INFO/' \
    && mkdir /var/run/sshd

VOLUME "${JENKINS_AGENT_HOME}" "/tmp" "/run" "/var/run"
WORKDIR "${JENKINS_AGENT_HOME}"

RUN localedef -c -f UTF-8 -i en_US en_US.UTF-8 \
    && export LC_ALL=en_US.UTF-8

ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${HOME}/.local/bin:${HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME

RUN echo "PATH=${PATH}" >> /etc/environment

RUN curl -sSLo /usr/local/bin/setup-sshd \
        https://raw.githubusercontent.com/jenkinsci/docker-ssh-agent/master/setup-sshd \
        && chmod +x /usr/local/bin/setup-sshd

EXPOSE 22

ENTRYPOINT ["setup-sshd"]

LABEL \
    org.opencontainers.image.vendor="Jenkins project" \
    org.opencontainers.image.title="Official Jenkins SSH Agent Docker image" \
    org.opencontainers.image.description="A Jenkins agent image which allows using SSH to establish the connection" \
    org.opencontainers.image.url="https://www.jenkins.io/" \
    org.opencontainers.image.source="https://github.com/jenkinsci/docker-ssh-agent" \
    org.opencontainers.image.licenses="MIT"

