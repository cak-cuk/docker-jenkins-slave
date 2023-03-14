# base image
FROM udienz/buildpack:centos5

#Below is original maintainer
#MAINTAINER shayashibara <meikyowise@gmail.com>

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install Packages
RUN yum update -y \
    && rpm -ivh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm \
    && yum install --nogpg -y passwd openssh openssh-server openssh-clients sudo python-devel \
    python-pip java-1.6.0-openjdk wget subversion bzrtools mercurial \
    && yum clean all
#RUN yum groupinstall -y "Development Tools"
WORKDIR /tmp
COPY sshd.conf /etc/supervisord.d/sshd.conf
RUN pip install --no-cache-dir supervisor \
    && mkdir /etc/supervisord.d /var/log/supervisor \
    && supervisord.conf /etc/supervisord.conf \
    && adduser jenkins \
    && echo "Defaults:jenkins !requiretty" >> /etc/sudoers.d/jenkins \
    && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/jenkins \
    && echo "jenkins:jenkins" | chpasswd \
    && mkdir /var/run/sshd && mkdir /var/log/ssh \
    && /usr/bin/ssh-keygen -q -t rsa1 -f /etc/ssh/ssh_host_key -C '' -N '' \
    && chmod 600 /etc/ssh/ssh_host_key && chmod 644 /etc/ssh/ssh_host_key.pub\
    && /usr/bin/ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N '' \
    && chmod 600 /etc/ssh/ssh_host_rsa_key && chmod 644 /etc/ssh/ssh_host_rsa_key.pub \
    && /usr/bin/ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N '' \
    && chmod 600 /etc/ssh/ssh_host_dsa_key && chmod 644 /etc/ssh/ssh_host_dsa_key.pub \
    && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd   \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config \
    && yum install --nogpg -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker \
    && yum clean all \
    && wget -q https://www.kernel.org/pub/software/scm/git/git-2.5.3.tar.gz \
    && tar xzf git-2.5.3.tar.gz
WORKDIR /tmp/git-2.5.3
RUN make prefix=/usr/local/git all \
    && make prefix=/usr/local/git install \
    && echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc \
    && . /etc/bashrc \
    && echo "export PATH=$PATH:/usr/local/git/bin" > /etc/profile.d/git.sh \
    && . /etc/bashrc \
    && which git \
    && git --version \
    && /usr/local/git/bin/git --version \
    && rm /tmp/git-2.5.3.tar.gz /tmp/git-2.5.3 -rf

# Expose sshd port
EXPOSE 22

# RUN supervisor
CMD ["/usr/bin/supervisord"]
