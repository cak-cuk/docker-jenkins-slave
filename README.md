Docker Images for Jenkins
=====================

This is docker images for jenkins slave, the images is working properly when using [Docker Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin)

[![GitHub commits](https://img.shields.io/github/commits-since/udienz/jenkins-docker/0.1.svg?maxAge=2592000)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/udienz/jenkins-docker.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/jenkins-docker)
[![Docker Stars](https://img.shields.io/docker/stars/udienz/jenkins-docker.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/jenkins-docker)
[![Docker Repository on Quay](https://quay.io/repository/udienz/jenkins/status "Docker Repository on Quay")](https://quay.io/repository/udienz/jenkins)

Access for this images is `jenkins:jenkins`

Avaliable images
----------------

Here is avaliable images:

Images | Version | pull |  Notes | Dockerfile
--- | --- | --- | --- | --- 
Debian | Jessie | `docker pull udienz/jenkins-docker:jessie` | - | [Dockerfile][1]
CentOS | 6 | `docker pull udienz/jenkins-docker:centos6` | git (2.5.3) | [Dockerfile][2]
CentOS | 6 | `docker pull udienz/jenkins-docker:centos6-ruby193` | git (2.5.3), perl 1.9.3 | [Dockerfile][3]
CentOS | 6 | `docker pull udienz/jenkins-docker:centos6-ruby200` | git (2.5.3), perl 2.0.0 | [Dockerfile][4]
CentOS | 7 | `docker pull udienz/jenkins-docker:centos7` | - | [Dockerfile][5]
Ubuntu | 14.04 | `docker pull udienz/jenkins-docker:trusty` | - | [Dockerfile][6]
Ubuntu | 16.04 | `docker pull udienz/jenkins-docker:xenial` | - | [Dockerfile][7]

Note:
- Mercurial, bazaar, and subversion is installed by default.

[1]: https://github.com/udienz/jenkins-docker/blob/master/jessie/Dockerfile
[2]: https://github.com/udienz/jenkins-docker/blob/master/centos6/Dockerfile
[3]: https://github.com/udienz/jenkins-docker/blob/master/centos6-ruby193/Dockerfile
[4]: https://github.com/udienz/jenkins-docker/blob/master/centos6-ruby200/Dockerfile
[5]: https://github.com/udienz/jenkins-docker/blob/master/centos7/Dockerfile
[6]: https://github.com/udienz/jenkins-docker/blob/master/trusty/Dockerfile
[7]: https://github.com/udienz/jenkins-docker/blob/master/xenial/Dockerfile

Etc...
------

Patch, suggestions, question is open to everyone
