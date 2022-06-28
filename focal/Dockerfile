# Generated in Tue Jun 28 05:04:50 AM UTC 2022
FROM udienz/buildpack:focal

ENV TZ="UTC"
# Install and configure a basic SSH server
RUN apt-get update && \
    ln -fs /usr/share/zoneinfo/UTC /etc/localtime && \
    apt-get install -y -q --no-install-recommends default-jdk=headless \
	  openssh-server git subversion bzr cvs sudo mercurial build-essential &&\
    apt-get clean -y && rm -rf /var/lib/apt/lists/* &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

# Set user jenkins to the image
RUN adduser --quiet --disabled-password --gecos '' jenkins \
    && echo "jenkins:jenkins" | chpasswd \
    && echo 'jenkins ALL=NOPASSWD: ALL' >> /etc/sudoers

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
