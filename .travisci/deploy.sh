#!/bin/bash

# ubuntu-xenial
docker push sourceforts/srcds-server:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push sourceforts/srcds-server:ubuntu-xenial
docker push sourceforts/srcds-server:ubuntu
docker push sourceforts/srcds-server:latest
