#!/bin/bash

# ubuntu-xenial
docker push sourceforts/dedicated-server:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:ubuntu-xenial
docker push sourceforts/dedicated-server:ubuntu
docker push sourceforts/dedicated-server:latest
