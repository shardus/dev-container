#!/bin/sh
devcontainer build --docker-path podman-remote --image-name registry.gitlab.com/shardus/dev-container --workspace-folder `pwd`
podman push registry.gitlab.com/shardus/dev-container                                                                         