# base image
FROM udienz/jenkins-docker:centos6

MAINTAINER Mahyuddin Susanto <mahyuddin@wowrack.com>
#Below is original maintainer 
#MAINTAINER shayashibara <meikyowise@gmail.com>

 
# Install Packages
RUN yum update -y
#RUN yum groupinstall -y "Development Tools" > /dev/null
RUN yum install -y curl which bash-completion

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && \curl -L get.rvm.io | bash -s stable \
    && /bin/bash -l -c "source /etc/profile.d/rvm.sh; rvm requirements" 
#RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh; rvm install ruby-1.9.3-p551" 
#RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh; rvm use ruby-1.9.3-p551 --default; rvm get stable --auto-dotfiles" \
#    && echo "gem: --no-ri --no-rdoc" > ~/.gemrc \
#    && echo "export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p551/bin" >> /etc/bashrc \
#    && echo "export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p551/bin" > /etc/profile.d/ruby.sh

RUN  echo "export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p551/bin" > /etc/profile.d/ruby.sh \
    && echo "export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p551/bin" >> /etc/bashrc \
RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh; rvm install 1.9.3-p551"
RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh; rvm use 1.9.3-p551 --default"
#RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh; rvm use 1.9.3-p551 --default; rvm get stable --auto-dotfiles";
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN /bin/bash -l -c "gem install bundler"

#RUN /bin/bash -l -c "source /etc/bashrc; ruby --version"
#RUN /bin/bash -l -c "echo $PATH; gem install bundler"
#RUN curl -L get.rvm.io > install \
#    && chmod +x install \
#    && gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
#    && /bin/bash install stable \
#    && . ~/.rvm/rvm.sh

#check ruby version

RUN yum clean all
# Expose sshd port
EXPOSE 22  

# RUN supervisor
#CMD ["/usr/bin/supervisord"]
