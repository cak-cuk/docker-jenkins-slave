# base image
FROM udienz/buildpack:centos6

MAINTAINER Mahyuddin Susanto <mahyuddin@wowrack.com>
#Below is original maintainer
#MAINTAINER shayashibara <meikyowise@gmail.com>

 
# Install Packages
RUN yum update -y \
    && rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm \
    && yum install --nogpg -y passwd openssh openssh-server openssh-clients sudo python-devel \
    python-pip java-1.7.0-openjdk wget subversion bzrtools mercurial cvs zip unzip ruby rubygems ruby-devel \
    && yum groupinstall "Development tools" -y \
    && yum remove -y git \
    && yum clean all

# Install supervisor
RUN pip install supervisor \
    && mkdir /etc/supervisord.d && mkdir /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf
ADD sshd.conf /etc/supervisord.d/sshd.conf

# 1. Add user jenkins to the image
# 2. When executing sudo, jenkins user does not require tty
# 3. No need password when executing sudo
# 4. Change password to jenkins, this is common password

RUN adduser jenkins \
    && echo "Defaults:jenkins !requiretty" >> /etc/sudoers.d/jenkins \
    && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/jenkins \
    && echo "jenkins:jenkins" | chpasswd

# Set up SSH
RUN mkdir /var/run/sshd && mkdir /var/log/ssh \
    && sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd   \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Git upgrade http://stackoverflow.com/questions/21820715/how-to-install-latest-version-of-git-on-centos-6-x-7-x?lq=1
RUN yum install --nogpg -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker gcc-c++ \
	gcc make
RUN wget https://codeload.github.com/gitster/git/zip/maint-2.5 -O /tmp/git-2.5.zip \
    && cd /tmp/ \
    && unzip /tmp/git-2.5.zip \
    && cd git-maint-2.5/ \
    && NO_EXPAT=yes NO_SVN_TESTS=yes NO_IPV6=yes NO_TCLTK=yes make prefix=/usr/local/git all \
    && NO_EXPAT=yes NO_SVN_TESTS=yes NO_IPV6=yes NO_TCLTK=yes make prefix=/usr/local/git install \
    && echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc \
    && source /etc/bashrc \
    && echo 'export PATH=$PATH:/usr/local/git/bin' > /etc/profile.d/git.sh

# Set up SSH Host Key
RUN /usr/bin/ssh-keygen -q -t rsa1 -f /etc/ssh/ssh_host_key -C '' -N '' \
    && chmod 600 /etc/ssh/ssh_host_key && chmod 644 /etc/ssh/ssh_host_key.pub \
    && /usr/bin/ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N '' \
    && chmod 600 /etc/ssh/ssh_host_rsa_key && chmod 644 /etc/ssh/ssh_host_rsa_key.pub \
    && /usr/bin/ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_dsa_key -C '' -N '' \
    && chmod 600 /etc/ssh/ssh_host_dsa_key && chmod 644 /etc/ssh/ssh_host_dsa_key.pub

RUN yum remove -y cloog-ppl db4-cxx db4-devel gdbm-devel \
    gettext gettext-libs glibc-devel.x86_64 glibc-headers kernel-headers \
    keyutils-libs-devel krb5-devel libart_lgpl libcom_err-devel libgcj libgomp \
    libidn-devel m4 mpfr perl-ExtUtils-ParseXS perl-Test-Harness perl-devel ppl \
    && yum clean all \
    && rm -rf /tmp/git-maint*

# Expose sshd port
EXPOSE 22

# RUN supervisor
CMD ["/usr/bin/supervisord"]
