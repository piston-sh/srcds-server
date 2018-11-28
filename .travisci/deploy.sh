#!/bin/bash
docker push sourceforts/dedicated-server:debian-$TRAVIS_BUILD_NUMBER
docker push sourceforts/dedicated-server:debian
docker push sourceforts/dedicated-server:latest