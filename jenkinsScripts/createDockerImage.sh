#!/bin/sh
docker build -t "$DockerOrg$DockerRepo:latest" .
docker push "$DockerOrg$DockerRepo:latest"
