#!/bin/bash

# ubuntu-trusty
docker push sourceforts/dedicated-server:ubuntu-trusty-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:ubuntu-trusty

# ubuntu-xenial
docker push sourceforts/dedicated-server:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:ubuntu-xenial
docker push sourceforts/dedicated-server:ubuntu
docker push sourceforts/dedicated-server:latest

# debian-stretch
docker push sourceforts/dedicated-server:debian-stretch-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:debian-stretch
docker push sourceforts/dedicated-server:debian
