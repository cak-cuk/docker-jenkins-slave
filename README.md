Docker Images for Jenkins
=====================

This is docker images for jenkins slave, the images is working properly when using [Docker Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin)

[![GitHub forks](https://img.shields.io/github/forks/badges/shields.svg?style=social&label=Fork&maxAge=2592000?style=flat-square)](https://github.com/udienz/jenkins-docker)[![GitHub commits](https://img.shields.io/github/commits-since/udienz/jenkins-docker/0.1.svg?maxAge=2592000)]() [![Docker Pulls](https://img.shields.io/docker/pulls/udienz/jenkins-docker.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/jenkins-docker) [![Docker Stars](https://img.shields.io/docker/stars/udienz/jenkins-docker.svg?maxAge=2592000)](https://hub.docker.com/r/udienz/jenkins-docker) [![Docker Repository on Quay](https://quay.io/repository/udienz/jenkins/status "Docker Repository on Quay")](https://quay.io/repository/udienz/jenkins)[![license](https://img.shields.io/github/license/udienz/jenkins-docker.svg?maxAge=2592000?style=flat-square)](https://github.com/udienz/jenkins-docker)

Access for this images is `jenkins:jenkins`

Avaliable images
----------------

Here is avaliable images:

Images | Version | tag |  Dockerfile | Jenkins status
--- | --- | --- | --- | ---
CentOS | 6 | `udienz/jenkins-docker:centos6` | [Dockerfile][2] | [![Build Status](https://jenkins.mahyudd.in/job/docker-centos6/badge/icon)](http://jenkins.mahyudd.in/job/docker-centos6)
CentOS | 6 | `udienz/jenkins-docker:centos6-ruby193` | [Dockerfile][3] | [![Build Status](https://jenkins.mahyudd.in/job/docker-centos6-ruby193/badge/icon)](http://jenkins.mahyudd.in/job/docker-centos6-ruby193)
CentOS | 6 | `udienz/jenkins-docker:centos6-ruby200` | [Dockerfile][4] | [![Build Status](https://jenkins.mahyudd.in/job/docker-centos6-ruby200/badge/icon)](http://jenkins.mahyudd.in/job/docker-centos6-ruby200)
CentOS | 7 | `udienz/jenkins-docker:centos7` | [Dockerfile][5] | [![Build Status](https://jenkins.mahyudd.in/job/docker-centos7/badge/icon)](http://jenkins.mahyudd.in/job/docker-centos7)
Debian | Jessie | `udienz/jenkins-docker:jessie`  | [Dockerfile][1] | [![Build Status](https://jenkins.mahyudd.in/job/docker-jessie/badge/icon)](http://jenkins.mahyudd.in/job/docker-jessie)
Debian | Wheezy | `udienz/jenkins-docker:wheezy`  | [Dockerfile][8] | [![Build Status](https://jenkins.mahyudd.in/job/docker-wheezy/badge/icon)](http://jenkins.mahyudd.in/job/docker-wheezy)
Debian | stretch | `udienz/jenkins-docker:stretch`  | [Dockerfile][8] | [![Build Status](https://jenkins.mahyudd.in/job/docker-stretch/badge/icon)](http://jenkins.mahyudd.in/job/docker-stretch)
Ubuntu | 14.04 | `udienz/jenkins-docker:trusty` | [Dockerfile][6] | [![Build Status](https://jenkins.mahyudd.in/job/docker-trusty/badge/icon)](http://jenkins.mahyudd.in/job/docker-trusty)
Ubuntu | 16.04 | `udienz/jenkins-docker:xenial` | [Dockerfile][7] | [![Build Status](https://jenkins.mahyudd.in/job/docker-xenial/badge/icon)](http://jenkins.mahyudd.in/job/docker-xenial)

Notes:
-----
1. I use git 2.5.3 in all centos images
2. centos6-ruby193 is used ruby 1.9.3
3. centos6-ruby200 is used ruby 2.0.0

[1]: https://github.com/udienz/jenkins-docker/blob/master/jessie/Dockerfile
[2]: https://github.com/udienz/jenkins-docker/blob/master/centos6/Dockerfile
[3]: https://github.com/udienz/jenkins-docker/blob/master/centos6-ruby193/Dockerfile
[4]: https://github.com/udienz/jenkins-docker/blob/master/centos6-ruby200/Dockerfile
[5]: https://github.com/udienz/jenkins-docker/blob/master/centos7/Dockerfile
[6]: https://github.com/udienz/jenkins-docker/blob/master/trusty/Dockerfile
[7]: https://github.com/udienz/jenkins-docker/blob/master/xenial/Dockerfile
[8]: https://github.com/udienz/jenkins-docker/blob/master/wheezy/Dockerfile
[9]: https://github.com/udienz/jenkins-docker/blob/master/stretch/Dockerfile

Etc...
------

Patch, suggestions, question is open to everyone
