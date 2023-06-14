# Docker Images for Jenkins

This is docker images for jenkins slave, the images is working properly when using [Docker Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin)

[![GitHub forks](https://img.shields.io/github/forks/badges/shields.svg?style=social&label=Fork&maxAge=2592000?style=flat-square)](https://github.com/cak-cuk/docker-jenkins-slave)[![GitHub commits](https://img.shields.io/github/commits-since/cak-cuk/docker-jenkins-slave/0.1.svg?maxAge=2592000)]() [![Docker Pulls](https://img.shields.io/docker/pulls/udienz/jenkins-slave.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/jenkins-docker) [![Docker Stars](https://img.shields.io/docker/stars/udienz/jenkins-slave.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/jenkins-slave) [![CI/CD](https://github.com/cak-cuk/docker-jenkins-slave/actions/workflows/ci.yml/badge.svg)](https://github.com/cak-cuk/docker-jenkins-slave/actions/workflows/ci.yml) [![license](https://img.shields.io/github/license/cak-cuk/docker-jenkins-slave.svg?maxAge=2592000?style=flat-square)](https://github.com/cak-cuk/docker-jenkins-slave)

Access for this images is `jenkins:jenkins` using ssh

## Avaliable images

Here is avaliable images:

### Clean install

Images | Version | docker tag |  Dockerfile |
--- | --- | --- | --- |
CentOS | 7 | `udienz/jenkins-slave:centos7` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/centos7/Dockerfile) |
Ubuntu | 20.04 | `udienz/jenkins-slave:ubuntu2004` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/ubuntu2004/Dockerfile) |
Ubuntu | 22.04 | `udienz/jenkins-slave:ubuntu2204` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/ubuntu2204/Dockerfile) |
Debian | 10 | `udienz/jenkins-slave:debian10` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/debian10/Dockerfile) |
Debian | 11 | `udienz/jenkins-slave:debian11` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/debian11/Dockerfile) |
Debian | 12 | `udienz/jenkins-slave:debian12` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/debian12/Dockerfile) |

### With ansible

Images | Version | docker tag |  Dockerfile |
--- | --- | --- | --- |
CentOS | 7 | `udienz/jenkins-slave:centos7-ansible` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/centos7-ansible/Dockerfile) |
Ubuntu | 20.04 | `udienz/jenkins-slave:ubuntu2004-ansible` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/ubuntu2004-ansible/Dockerfile) |
Ubuntu | 22.04 | `udienz/jenkins-slave:ubuntu2204-ansible` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/ubuntu2204-ansible/Dockerfile) |
Debian | 10 | `udienz/jenkins-slave:debian10-ansible` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/debian10-ansible/Dockerfile) |
Debian | 11 | `udienz/jenkins-slave:debian11-ansible` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/debian11-ansible/Dockerfile) |
Debian | 12 | `udienz/jenkins-slave:debian12-ansible` | [Dockerfile](https://github.com/cak-cuk/docker-jenkins-slave/blob/main/debian12-ansible/Dockerfile) |
