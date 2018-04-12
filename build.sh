#!/bin/bash

# 清除已有的
docker stop redis
docker rm redis
docker rmi kolehank/redis 

# 重新生成
docker build -t kolehank/redis ./
