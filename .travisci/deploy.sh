#!/bin/bash

# ubuntu-xenial
docker push pistonsh/srcds-server:ubuntu-xenial-$TRAVIS_BUILD_NUMBER
docker push pistonsh/srcds-server:ubuntu-xenial
docker push pistonsh/srcds-server:ubuntu
docker push pistonsh/srcds-server:latest
