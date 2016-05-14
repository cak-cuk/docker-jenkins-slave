# This Dockerfile is used to build an image containing basic stuff to be used as a Jenkins slave build node.
FROM ubuntu:xenial
MAINTAINER mahyuddin susanto <udienz@gmail.com>


# Install and configure a basic SSH server
RUN apt-get update &&\
    apt-get install -y --no-install-recommends openssh-server git subversion &&\
    apt-get clean -y && rm -rf /var/lib/apt/lists/* &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
RUN apt-get update &&\
    apt-get install -y --no-install-recommends default-jdk &&\
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Set user jenkins to the image
RUN adduser --quiet --disabled-password --gecos '' jenkins \
    && echo "jenkins:jenkins" | chpasswd \
    && echo 'jenkins ALL=NOPASSWD: ALL' >> /etc/sudoers

RUN mkdir ~jenkins/.ssh && chmod 700 ~jenkins/.ssh \
 && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF9I3Zhl0oY1c0V7+GGMXEfQ0LzKQoxb9yKyGp2z0YgAD2KvzLmPGgFHBcVmut/QtW4URHUzPWpBPQS/ZxJlmHiKQxIJZxV3w8QT2unc2oQ8ykTSUrZo8suOGPyaa2LVNWn1pP3tIKC9Aerg+5mm8UIv5aYwnQssItVuNhlQQfRGsl/rTcgzJJLucoB4I2tBx+rQcoEqv1G2FNJmfVj96O4NV0oR2FSBiE3eoLX8bu4M7ugiYiEimDvvxG1fKAWbjdNxfT+FNqhOeBfsHW8vywVhj5VlB9koDvHkGZpeIKNyNdfrfSzYHeKv+XMLP05gJ1twXIBDZ0zNJYuAo6qOzd jenkins_rsa" > ~jenkins/.ssh/authorized_keys \
 && echo "ssh-dss AAAAB3NzaC1kc3MAAACBAOlRjhFmkkdzznnm4B0hy5dY/YWDUEX1AiAkeeS1ZSfMHF8wGeQ6LN66SN6ulxouDOZ7cgBwF6bYyWPZh95oSj90h4m6uNuX6alq/PrUodYxZ7+Qcm259gQEi0SmBcYPoTmBub6FOK+Rq/ehI9jJuLK5x7M3V+hYuBCOaTNhDOn3AAAAFQDgy/8/OFgfVBQI0Sa/ZZLwy1uoZwAAAIB3VokK1EcL4naE6iUl5In76TrJ9DNOYPZq9hH4UFr8djREIMHaUs7PynGHWKJofyb/K/2EQHHqXpGk4LUL8ntx30R2ZGeb6Qcx/qpFIxiYGk2TZdLO0tH9UpsqSQX63MA03ER52JWxAoUkBIm6/X3CwubhpAhoWUuXYf/OcUU64AAAAIBKey9L8TozLbpYMDyflg3jrV1CyNW1fjUCRyXief0XGmaGJ75JIUsCpIbbvoMi7TXiY+LtTBeSAKlo7AwB2DB+N2d2Kzq8mY1QNm6NMqKj60V8DULbg6C28+wkBF8oBSvNztw3d+SUtLnVtTbN1pA2VmR2naLx3tEaUjN4HF8VMA==" >> ~jenkins/.ssh/authorized_keys \
 && echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO3nNoPVVbx2ZtLZ/V9Bu4VleQ5XKkFq7Pg+9Pd8i/xE1hUEzsT7lh7JHkueqUihWEWzGEv7lGeA0NWXvvNpJUn1WpTFJjPICQBX3EXFBvOIR3GpV5xLsiLaq8UVMj1BIzzuiQZzCbV7+3v6MGFC779DgxC2RKLXdCz/LhxPrawRS0JJLOAdO/tPXpToDgbCqtf6BVSN4PKsbF/+RrlEa7KjDL8si2TcNmPFFuZ/qbIjqNpc8jN6GtpVofAjXYnfS2cIjoJsMbmH2GqwtgwAF0KzHGInuK92esD7/gnmZrK1meJHmu66K8HzKnu1KPMIvQKWB1oDo3riEisnVxQQW7 jenkins@jenkins" >> ~jenkins/.ssh/authorized_keys \
 && chown jenkins.jenkins ~jenkins/.ssh/ -R \
 && chmod 600 ~jenkins/.ssh/authorized_keys

# Change repo
RUN echo "" > /etc/apt/sources.list\
    && echo 'deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu xenial main restricted universe multiverse' > /etc/apt/sources.list.d/amazon.list \
    && echo 'deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu xenial-updates main restricted universe multiverse' >> /etc/apt/sources.list.d/amazon.list \
    && echo 'deb http://us-west-2.ec2.archive.ubuntu.com/ubuntu xenial-security main restricted universe multiverse' >> /etc/apt/sources.list.d/amazon.list
# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
