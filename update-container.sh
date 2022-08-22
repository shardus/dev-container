#!/bin/sh
# [AS] On Silverblue, the devcontainer/cli is installed in a distrobox container (fedora) which needs to have podman-remote installed:
#   sudo dnf install podman-remote
# and the --docker-path needs to be podman-remote
devcontainer build --docker-path podman-remote --image-name registry.gitlab.com/shardus/dev-container --workspace-folder $(pwd)
podman login registry.gitlab.com/shardus/dev-container
podman push registry.gitlab.com/shardus/dev-container
