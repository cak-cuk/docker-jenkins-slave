# base image
FROM udienz/jenkins-docker:centos6

MAINTAINER Mahyuddin Susanto <mahyuddin@wowrack.com>
#Below is original maintainer
#MAINTAINER shayashibara <meikyowise@gmail.com>

# Install Packages
#RUN yum groupinstall -y "Development Tools" > /dev/null
RUN yum clean all \
    && rpm --rebuilddb; yum install --nogpg -y \
    autoconf automake bison curl-devel gcc gcc-c++ \
    git-core httpd-devel libevent-devel libxml2 libxml2-devel \
    mysql-devel openssl openssl-devel readline-devel \
    sqlite-devel zlib zlib-devel libxslt libxslt-devel wget \
    && yum clean all

WORKDIR /tmp
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz \
    && tar xzf /tmp/ruby-install-0.6.0.tar.gz && cd ruby-install-0.6.0 && make install \
    && ruby-install --install-dir /usr/ ruby 1.9.3-p547 \
    && gem install --no-ri --no-rdoc bundler \
    && gem update --system \
    && rm -rf /tmp/ruby-install*
WORKDIR /

#check ruby version
RUN ruby --version

RUN yum remove -y  autoconf \
    automake bison curl-devel gcc gcc-c++ git-core httpd-devel \
    libevent-devel libxml2-devel mysql-devel \
    openssl-devel readline-devel sqlite-devel zlib-devel \
    libxslt libxslt-devel openldap-devel ncurses-devel \
    apr-util-devel apr-util-ldap apr-util cyrus-sasl cyrus-sasl-devel

# Expose sshd port
EXPOSE 22  

# RUN supervisor
#CMD ["/usr/bin/supervisord"]
