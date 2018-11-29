#!/bin/bash

# ubuntu-trusty
docker push sourceforts/dedicated-server:ubuntu-trusty-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:ubuntu-trusty
docker push sourceforts/dedicated-server:ubuntu
docker push sourceforts/dedicated-server:latest

# ubuntu-xenial
docker push sourceforts/dedicated-server:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:ubuntu-xenial

# debian-stretch
docker push sourceforts/dedicated-server:debian-stretch-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:debian-stretch
docker push sourceforts/dedicated-server:debian
