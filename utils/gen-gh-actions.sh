#!/bin/bash

set =x
BASE=$CI_PROJECT_DIR
DISTRO="centos6 centos7 trusty xenial bionic focal jammy jessie stretch buster bullseye bookworm"
GHA=$BASE/.github/workflows
rm .github/workflows/*.yml


for x in $DISTRO
do
    PR=.github/workflows/$x-pull-request.yml
    echo "name: check $x dockerfile for PR
on:
  pull_request:
    branch-ignore:
      - \"main\"
      - \"master\"
jobs:
  hadolint:
    runs-on: [\"self-hosted\"]
    steps:
     - name: Checkout
       uses: actions/checkout@master
     - name: Hadolint
       uses: hadolint/hadolint-action@v1.6.0
       with:
         dockerfile: $x/Dockerfile
" > $PR
	LINT=.github/workflows/$x-lint.yml
  echo "name: Check $x Dockerfile
on:
  push:
    branches-ignore:
      - \"master\"
      - \"main\"
jobs:
  hadolint:
    runs-on: [\"self-hosted\"]
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Hadolint
      uses: hadolint/hadolint-action@v1.6.0
      with:
        dockerfile: $x/Dockerfile
  create-pull-request:
    name: create-pull-request
    needs: hadolint
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2.3.4
      - name: Create Pull Request
        id: open-pr
        uses: repo-sync/pull-request@v2
        with:
          destination_branch: \"master\"
          pr_title: \"[DRAFT] pull_request\"
          pr_body: \"PR Request from \${{ github.event_name }} event to \${{ github.ref }}.\"
          github_token: \${{ secrets.GH_TOKEN }}
" > $LINT

	OUT=.github/workflows/$x.yml
  echo "name: Build $x docker image
on:
  push:
    branches: [ \"main\", \"master\" ]
  schedule:
    - cron: '0 1 */15 * *'
jobs:
  hadolint:
    runs-on: [\"self-hosted\"]
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Hadolint
      uses: hadolint/hadolint-action@v1.6.0
      with:
        dockerfile: $x/Dockerfile
  build:
    runs-on: [\"self-hosted\"]
    needs: [\"hadolint\"]
    steps:
    - uses: actions/checkout@master

    - name: Build and Publish to Registry
      uses: elgohr/Publish-Docker-Github-Action@master
      with:
        name: udienz/jenkins-docker
        username: \${{ github.actor }}
        password: \${{ secrets.DOCKER_PASSWORD }}
        dockerfile: $x/Dockerfile
        buildoptions: \"--compress --force-rm\"
        tags: \"$x\"
" > $OUT

done
